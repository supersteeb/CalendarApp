class Todolist < ApplicationRecord
	has_many :todoitems, dependent: :destroy
	scope :today, -> {where(created_at: DateTime.current.change(hour:00)..DateTime.current.change(hour:23, minute: 59))}
	scope :last_1_months, -> {where(created_at: Date.current.beginning_of_month..Date.current)}
	scope :last_3_months, -> {where(created_at: Date.current.prev_month(2).change(day: 1)..Date.current)}
	scope :last_6_months, -> {where(created_at: Date.current.prev_month(5).change(day: 1)..Date.current)}
	after_create :add_default_todoitem

	def add_default_todoitem
		Defaultitem.active.each do |item|
				self.todoitems.create(name: item.name,
															desc: item.desc) if today_have_this(item)
		end
	end

	# def self.last_3_months
	# 	Hash[(1..12).map { |month| [ month, 0 ] }].merge(h)
	# end

	private

	def today_have_this(item)
		current_date = Time.current.strftime('%A').downcase
		freq         = item.frequency
		(freq.count == 7) || (freq.include? current_date)
	end
end
