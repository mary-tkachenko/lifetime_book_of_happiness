class Post < ApplicationRecord
    has_many :tags, :through => :clouds
    has_many :images, :through => :clouds
    belongs_to :user, optional: true
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :skills, :interests




end
