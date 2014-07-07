class Resource < ActiveRecord::Base
  attr_accessible :name, :type, :information
  belongs_to :course
end
