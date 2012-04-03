class GathersController < ApplicationController

  before_filter :get_gather, only: [:show, :edit, :destroy]
  before_filter :get_gathers, only: [:index, :menu, :show, :new]
  before_filter :authenticate_user!

  # Gathers Controller require verified users
  before_filter :authenticate_user!

  @@log = Logger.new(STDOUT)

  def index

  end

  def menu

  end

  def show
    # Still need @gathers here to display menu
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
    @gather.delete
    redirect_to gathers_url
  end

  private

  def generate_gather(gather)
    @gather = gather
    text = nil

    begin
      text = open(@gather.url).read
    rescue => e
      @@log.debug e
      redirect_to gathers_url, :flash => { :alert => "Unable to fetch the content."}
      return
    end

    @gather.title = Readability::Document.new(text).title
    @gather.content = Readability::Document.new(text,
      :tags => ['h1', 'h2', 'h3', 'img', 'li', 'ul', 'a', 'p', 'div', 'span', 'br'],
      :attributes => ['src', 'href'],
      :remove_unlikely_candidates => false).content
    @md5_new = Digest::MD5.hexdigest(@gather.content)
    @md5_last = Digest::MD5.hexdigest(Gather.last.content)
    if @md5_new === @md5_last
      @gather.user = current_user
      @gather.save
      redirect_to gathers_url
    else
      redirect_to gathers_url, :flash => { :alert => "Content repeated."}
  end

  def get_gather
    @gather = Gather.find(params[:id])
  end

  def get_gathers
    unless current_user.nil?
      @@log.debug "current user id: " + current_user.id.to_s()
      @gathers = Gather.where(:user_id => current_user.id).order("updated_at DESC")
    end
  end

end
