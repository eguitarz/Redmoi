class Gather < ActiveRecord::Base
  has_one :format
  belongs_to :user
end
