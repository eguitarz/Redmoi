class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @gathers = Gather.find(:all, :include => :user, :order => "updated_at DESC")
  end
end
