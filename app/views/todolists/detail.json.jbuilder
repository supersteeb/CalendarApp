json.id @todolist.id
json.percent @todolist.percent
json.created_at @todolist.created_at.strftime('%A, %B %e, %Y')
json.todo_items @todolist.todoitems do |item|
	json.name item.name
	json.desc item.desc
	json.is_done item.is_done
end
