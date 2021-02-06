class Tag < ApplicationRecord
    has_many :estags, dependent: :destroy
    has_many :entrysheet2s, through: :estags
    
end

