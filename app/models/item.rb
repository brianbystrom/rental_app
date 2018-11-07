class Item < ApplicationRecord
    has_many_attached :images
    has_many :rentals
    belongs_to :user
end
