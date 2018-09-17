class Tag < ApplicationRecord
    has_many :posts, :through => :clouds
end
