json.extract! room, :id, :number, :floor, :created_at, :updated_at
json.url room_url(room, format: :json)
