json.extract! t, :id, :title, :description, :author, :tags, :created_at, :updated_at
json.url t_url(t, format: :json)
