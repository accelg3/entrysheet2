class Correctedentrysheet2 < ApplicationRecord
  validates :memo, presence: true, length: { maximum: 255 }
  mount_uploader :correctedesfile, Correctedesfile2Uploader
  belongs_to :user
  belongs_to :entrysheet2
end
