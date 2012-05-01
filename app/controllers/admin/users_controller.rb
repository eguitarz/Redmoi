class Admin::UsersController < ApplicationController
  before_filter :get_users, only: [:index]
  before_filter :get_user, only: [:show, :edit, :destroy]

  layout 'admin'

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end

  def show
    @gathers = Gather.where(:user_id => @user.id).order('updated_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
    @gathers_to_delete = Gather.where(:user_id => @user.id)
    @gathers_to_delete.each do |g|
      g.delete
    end

    @user.delete
    redirect_to users_url
  end

  private

  def get_users
    @users = User.all
  end

  def get_user
    @user = User.find(params[:id])
  end

end
