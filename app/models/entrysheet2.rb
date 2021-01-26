class Entrysheet2 < ApplicationRecord
  validates :company,:industry,:business, presence: true, length: { maximum: 255 }
  mount_uploader :esfileup, Esfile2Uploader
  belongs_to :user
  has_many :correctedentrysheet2s
end
