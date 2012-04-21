class GathersController < ApplicationController

  before_filter :get_gather, only: [:show, :edit, :destroy]
  before_filter :get_gathers, only: [:index, :menu, :show, :new, :destroy]
  before_filter :authenticate_user!

  # Gathers Controller require verified users
  before_filter :authenticate_user!

  @@log = Logger.new(STDOUT)

  def index

  end

  def menu

  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @gather = Gather.new
  end

  def create
    @@log.debug "Action => create"
    @gather = Gather.new(params[:gather])
    generate_gather(@gather)
  end

  def create_by_url
    @@log.debug "Action => create_by_url"
    @gather = Gather.new
    @gather.url = params[:url]
    generate_gather(@gather)
  end

  def edit

  end

  def update

  end

  def destroy
    respond_to do |format|
      format.js { render :gid => @gather.id }
    end
    @gather.delete if current_user && @gather.user_id == current_user.id
    #redirect_to gathers_url
  end

  private

  def generate_gather(gather)
    @gather = gather
    text = nil

    @gather.url = 'http://' + @gather.url if @gather.url.slice(0..6) != 'http://'

    begin
      @gather.start_gathering
    rescue => e
      @@log.debug e
      redirect_to gathers_url, :flash => { :alert => "Unable to fetch the content."}
      return
    end

    # User input limit check
    if get_gathers.size >= Settings.article_limit
      redirect_to gathers_url, :flash => {:alert => "Cannot add more url, reach the system limit."} if get_gathers.size > 10
      return
    end

    @gather.user = current_user
    @gather.save
    redirect_to gather_url(@gather), :flash => {:notice => "Success"}
  end

  def get_gather
    @gather = Gather.find(params[:id])
  end

  def get_gathers
    unless current_user.nil?
      @gathers = Gather.where(:user_id => current_user.id).order("updated_at DESC")
    end
  end

end
