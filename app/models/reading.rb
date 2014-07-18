class Reading < ActiveRecord::Base
	attr_accessible :number, :audio
	belongs_to :course
	has_attached_file :audio
	validates_attachment_presence :audio
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']

	after_save :set_name
	BYTES_PER_SEC = 16004.96358521672

	def time
		time = self.audio_file_size.to_f / BYTES_PER_SEC
		minutes = (time / 60.0).floor
		seconds = (time - minutes*60.0).round
		seconds = '0' + seconds.to_s if seconds < 10
		"#{minutes}:#{seconds}"
	end

	def rename(name)
		FileUtils.move(self.audio.path, File.join(File.dirname(self.audio.path), name))
	end

	def set_name
		name = "Unit #{self.number}.mp3"
		return if self.audio.path == File.join(File.dirname(self.audio.path), name)
		self.rename(name)
		self.audio_file_name = "Unit #{self.number}.mp3"
	  self.save
 	end
end
