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

  def gathers
  end

  private

  def get_gathers
    @gathers = Gather.find(:all, :include => :user, :order => "updated_at DESC")
  end
end
