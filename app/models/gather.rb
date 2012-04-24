class Gather < ActiveRecord::Base
  has_one :format
  belongs_to :user

  attr_accessible :title, :content, :description, :keyword, :url

  def content
    read_attribute(:content).gsub(/['"\\\x0]/,'\\\\\0')
  end

  def start_gathering
    self.url = 'http://' + self.url if self.url.slice(0..6) != 'http://'
    juice = Juice.new(self.url)
    juice.extract
    self.title = juice.title
    self.content = juice.content
  end
end
