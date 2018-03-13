json.extract! user, :id, :reg_number, :name, :email, :course, :room, :created_at, :updated_at
json.url user_url(user, format: :json)
