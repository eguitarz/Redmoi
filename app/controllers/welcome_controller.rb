require 'open-uri'
class WelcomeController < ApplicationController
  def index
    text = open("http://tw.news.yahoo.com/%E6%84%9B%E6%83%85eq%E8%AA%BF%E6%9F%A5-%E5%A4%A7%E5%AD%B8%E6%83%85%E4%BE%B6%E5%88%86%E6%89%8B%E4%B8%BB%E5%9B%A0-%E6%B2%92%E6%84%9F%E8%A6%BA%E4%BA%86-190700013.html").read
    @aaa = Readability::Document.new(text).title
    @bbb = Readability::Document.new(text).content
    @gathers = Gather.all
  end
end
