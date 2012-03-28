require 'open-uri'
class WelcomeController < ApplicationController
  def index
    @gathers = Gather.all
  end
end
