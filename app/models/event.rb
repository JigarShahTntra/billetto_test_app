class Event < ApplicationRecord
  validates :title, :description, :date, :image_url, presence: true
end
