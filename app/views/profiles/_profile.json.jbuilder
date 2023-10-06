json.extract! profile, :id, :id, :profile_pic, :nick_name, :description, :location, :created_at, :updated_at
json.url profile_url(profile, format: :json)
