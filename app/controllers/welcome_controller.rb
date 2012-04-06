require 'open-uri'
class WelcomeController < GathersController
  def index
    get_gathers
  end
end
