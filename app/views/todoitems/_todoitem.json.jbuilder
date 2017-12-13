json.extract! todoitem, :id, :created_at, :updated_at
json.url todoitem_url(todoitem, format: :json)
