class GathersController < ApplicationController

  before_filter :get_gather, only: [:show, :edit, :destroy]
  before_filter :get_gathers, only: [:index, :menu, :show, :new, :destroy]
  before_filter :authenticate_user!, except: [:create_by_image]

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

    begin
      generate_gather(@gather)
      redirect_to gather_url(@gather), :flash => {:notice => "Success"}
    rescue Exception => e
      @@log.warn("Error in creating gather. #{e}")
      redirect_to gather_url(@gather), :flash => {:notice => "We recommand to visit the site directly."}
    end
  end

  def create_by_image
    if authenticate_user!
      @gather = Gather.new
      @gather.url = params[:url]
      width = 1
      height = 1

      begin
        generate_gather(@gather)
      rescue => e
        @@log.debug(e)
        width = 2
        height = 2
      end
    else
      width = 3
      height = 3
    end
    output = []
    output << 'G' << 'I' << 'F' << '8' << '9' << 'a' << width << 0
    output << height << 0 << 0x0 << 0 << 0 << 0x2c << 0 << 0
    output << 0 << 0 << width << 0 << height << 0 << 0 << 0x3b

    bin = ''
    output.each do |b|
      bin += b.chr
    end

    send_data(bin)
  end

  def edit

  end

  def update

  end

  def destroy
    @gather.delete if current_user && @gather.user_id == current_user.id
    respond_to do |format|
      format.js { render :gid => @gather.id }
      format.html { redirect_to gathers_url, :flash => {:notice => 'Deleted the article' } }
    end

  end

  private

  def generate_gather(gather)
    @gather = gather

    if check_limit
      raise 'Cannot add more url, reach the system limit.'
    end

    begin
      @gather.start_gathering
    rescue => e
      @@log.debug e
      raise "Unable to fetch the content."
    end

    @gather.user = current_user

    begin
      @gather.save
    rescue => e
      @gather.content = 'Recommand to visit <a href="' + @gather.url + '" target="_blank">web</a> directly.'
      @gather.save
      raise "Error in saving gatehr."
    end
  end

  def check_limit
    get_gathers.size >= Settings.article_limit
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
