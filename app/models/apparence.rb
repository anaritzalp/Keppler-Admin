class Apparence < ActiveRecord::Base
	belongs_to :setting
	mount_uploader :image_background, AttachmentUploader
end
