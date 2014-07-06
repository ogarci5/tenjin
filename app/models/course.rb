class Course < ActiveRecord::Base
	attr_accessible :name
	has_many :units
  has_many :resources
end
