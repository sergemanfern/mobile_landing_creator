class Advantage < ApplicationRecord
  after_update :crop_icon
  belongs_to :page
  validates :description, presence: true

  mount_uploader :icon, IconUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop_icon
    icon.recreate_versions! if crop_x.present?
  end

end
