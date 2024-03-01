json.extract! post, :id, :post_title, :description, :link, :profile_id, :created_at, :updated_at
json.url api_v1_post_url(post, format: :json)
