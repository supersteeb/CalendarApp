class Todolist < ApplicationRecord
	has_many :todoitems, dependent: :destroy
	scope :today, -> {where(created_at: DateTime.current.change(hour:00)..DateTime.current.change(hour:23, minute: 59))}
	after_create :add_default_todoitem

	def add_default_todoitem
		Defaultitem.active.each do |item|
				self.todoitems.create(name: item.name,
															desc: item.desc) if today_have_this(item)
		end
	end

	private

	def today_have_this(item)
		current_date = Time.current.strftime('%A').downcase
		freq         = item.frequency
		(freq.count == 7) || (freq.include? current_date)
	end
end
