class Post < ApplicationRecord
    has_many :tags
    has_many :images
    has_many_attached :uploads
    belongs_to :user, optional: true
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :skills, :interests

end
