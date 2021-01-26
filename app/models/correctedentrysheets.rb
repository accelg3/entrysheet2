class Correctedentrysheet < ApplicationRecord
  mount_uploader :correctedesfile, CorrectedesfileUploader
  belongs_to :user
  belongs_to :entrysheet2
end
