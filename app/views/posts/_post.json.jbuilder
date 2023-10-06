json.extract! post, :id, :post_id, :post_name, :pic, :description, :link, :created_at, :updated_at
json.url post_url(post, format: :json)
