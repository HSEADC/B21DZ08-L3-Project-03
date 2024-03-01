json.extract! employment_opportunity, :id, :title, :description, :vacancy_type, :created_at, :updated_at
json.url api_v1_employment_opportunity_url(employment_opportunity, format: :json)
