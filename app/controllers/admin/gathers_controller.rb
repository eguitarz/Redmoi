class Admin::GathersController < ApplicationController
  before_filter :get_gathers, only: [:index]
  before_filter :get_gather, only: [:show, :edit, :destroy]

  layout 'admin'

  def index
  end

  def new
    @gather = User.new
  end

  def create
    @gather = User.new(params[:gather])
  end

  def show
    @user = User.find(@gather.user_id)
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

  def get_gathers
    @gathers = Gather.find(:all, :order => 'updated_at DESC')
  end

  def get_gather
    @gather = Gather.find(params[:id])
  end
end
