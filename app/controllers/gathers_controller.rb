class GathersController < ApplicationController
  
  before_filter :get_gather, only: [:show, :edit, :destroy]
  
  def index
    @gathers = Gather.all
  end
  
  def show

  end
  
  def new
    @gather = Gather.new
  end
  
  def create
    
  end
  
  def edit

  end
  
  def update
    
  end
  
  def destroy

  end

  private
  def get_gather
    @gather = Gather.find(params[:id])
  end

end
