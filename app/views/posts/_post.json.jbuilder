json.extract! post, :id, :post_title, :pic, :description, :link, :profile_id, :created_at, :updated_at
json.url post_url(post, format: :json)
