require 'carrierwave/orm/activerecord'

class Content < ApplicationRecord
	mount_uploader :image, ImageUploader
end