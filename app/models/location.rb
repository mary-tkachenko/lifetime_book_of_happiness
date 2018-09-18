class Location < ApplicationRecord
    belongs_to :posts, optional: true
end
