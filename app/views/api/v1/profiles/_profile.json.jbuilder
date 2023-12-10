json.extract! profile, :id, :profile_id, :profile_pic, :nick_name, :description, :location, :created_at, :updated_at
json.url api_v1_profile_url(profile, format: :json)
