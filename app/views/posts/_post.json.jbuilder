json.extract! post, :id, :text, :image, :date, :created_at, :updated_at
json.url post_url(post, format: :json)
