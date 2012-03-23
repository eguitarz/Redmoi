class GathersController < ApplicationController

  before_filter :get_gather, only: [:show, :edit, :destroy]
  before_filter :get_gathers, only: [:index, :menu, :show, :new]

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
    @gather = Gather.new(params[:gather])
    text = open(@gather.url).read
    @gather.title = Readability::Document.new(text).title
    @gather.content = Readability::Document.new(text,
      :tags => ['h1', 'h2', 'h3', 'img', 'li', 'ul', 'a', 'p', 'div', 'span'],
      :attributes => ['src', 'href']).content

    @gather.save

    redirect_to gathers_url
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
  def get_gather
    @gather = Gather.find(params[:id])
  end

  def get_gathers
    @gathers = Gather.all
  end

end
