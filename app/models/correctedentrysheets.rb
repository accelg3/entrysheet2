class Correctedentrysheet < ApplicationRecord
  mount_uploader :correctedesfile, CorrectedesfileUploader
  belongs_to :user
  belongs_to :entrysheet2
  has_many :tags, through: :estags
  has_many :estags, dependent: :destroy
end
