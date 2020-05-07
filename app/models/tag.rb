class Tag < ApplicationRecord
    has_many :gossip_tags
    has_many :gossips, through: :gossip_tags
    validates :title,
      presence: true,
      length: { maximum: 25 }
end
