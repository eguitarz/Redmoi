class WelcomeController < ApplicationController
  def index
    @gather = Gather.all
  end
end
