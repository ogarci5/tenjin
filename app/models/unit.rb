class Unit < ActiveRecord::Base
  attr_accessible :number, :audio
	belongs_to :course
	has_attached_file :audio
	validates_attachment_presence :audio
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
end
