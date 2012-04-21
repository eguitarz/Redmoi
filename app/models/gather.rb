class Gather < ActiveRecord::Base
  has_one :format
  belongs_to :user

  attr_accessible :title, :content, :description, :keyword, :url

  def start_gathering
    juice = Juice.new(self.url)
    juice.extract
    self.title = juice.title
    self.content = juice.content
  end
end
