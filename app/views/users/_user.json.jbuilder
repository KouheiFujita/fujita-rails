json.extract! user, :id, :no, :name, :kana, :memo, :created_at, :updated_at
json.url user_url(user, format: :json)
