class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_gathers
  layout "admin"

  def index
    @user_size = User.count
    @gather_size = Gather.count
  end

  def users
    @users = User.all
  end

  def delete_user
    @gathers_of_user = Gather.where(:user_id => params[:id])
    @gathers_of_user.each {|g| g.delete}
    @user = User.find(params[:id])
    @user.delete
  end

  def gathers
  end

  private

  def get_gathers
    @gathers = Gather.find(:all, :include => :user, :order => "updated_at DESC")
  end
end
