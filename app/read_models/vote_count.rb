class VoteCount < ApplicationRecord
  validates :event_id, presence: true
end
