class Post < ApplicationRecord
    has_many :tags, :through => :clouds
    has_many :images, :through => :clouds
    belongs_to :user
end
