class Rental < ApplicationRecord
    belongs_to :items
    belongs_to :users
end
