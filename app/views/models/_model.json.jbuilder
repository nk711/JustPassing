json.extract! model, :id, :Review, :rating, :comment, :created_at, :updated_at
json.url model_url(model, format: :json)
