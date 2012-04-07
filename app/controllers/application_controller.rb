class ApplicationController < ActionController::Base
  protect_from_forgery

  # Default setting for general scope
  Settings.article_limit = 50
end
