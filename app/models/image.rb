class Image < ActiveRecord::Base
	has_many :image_annotations
	def thumbnail_url
		thumb = url.gsub(".jpg", "-thm.jpg")
	end
	def user_annotations(user_id)
		image_annotations.where(user_id: user_id)
	end
end
