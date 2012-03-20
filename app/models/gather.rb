class Gather < ActiveRecord::Base
  has_one :format
  belongs_to :user

  attr_accessible :title, :content, :description, :keyword, :url
end
