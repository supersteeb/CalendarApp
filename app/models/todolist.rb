class Todolist < ApplicationRecord
	has_many :todoitems, dependent: :destroy
	scope :today, -> {where(created_at: DateTime.current.change(hour:00)..DateTime.current.change(hour:23, minute: 59))}
	after_create :add_default_todoitem

	def add_default_todoitem
		Defaultitem.active.each do |item|
			if item.frequency.include? Time.current.strftime('%A').downcase
				self.todoitems.create(name: item.name, desc: item.desc)
			end
		end
	end
end
