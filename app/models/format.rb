class Format < ActiveRecord::Base
  belongs_to :gather

  attr_accessible :name, :parser
end
