class Entrysheet2 < ApplicationRecord
  
  validates :company,:business, presence: true, length: { maximum: 255 }
  mount_uploader :esfileup, Esfile2Uploader
  belongs_to :user
  has_many :correctedentrysheet2s,dependent: :destroy
  has_many :estags, dependent: :destroy
  has_many :tags, through: :estags
  


end

