require 'rubygems'
require 'readability'
require 'open-uri'

source = open('http://graphics.stanford.edu/~mdfisher/projects.html').read
puts Readability::Document.new(source).content
