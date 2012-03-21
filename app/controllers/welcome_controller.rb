require 'open-uri'
class WelcomeController < ApplicationController
  def index
    @gathers = Gather.all
    
    text = open(@gathers.first.url).read
    @gather_title = Readability::Document.new(text).title
    @gather_content = Readability::Document.new(text, 
      :tags => ['h1', 'h2', 'h3', 'li', 'ul', 'a', 'p', 'div'],
      :attributes => ['href']).content
  end
end
