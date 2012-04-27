class Gather < ActiveRecord::Base
  has_one :format
  belongs_to :user

  attr_accessible :title, :content, :description, :keyword, :url
  scope :everything, find(:all, :order => 'updated_at DESC')
  scope :everything_with_users, find(:all, :include => :user, :order => 'updated_at DESC')

  def start_gathering
    self.url = 'http://' + self.url if self.url.slice(0..6) != 'http://'
    juice = Juice.new(self.url)
    juice.extract
    self.title = juice.title
    self.content = juice.content
  end
end
