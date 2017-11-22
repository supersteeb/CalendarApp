json.extract! todolist, :id, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)
