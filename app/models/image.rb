class Image < ApplicationRecord
    has_many :posts, :through => :clouds
end
