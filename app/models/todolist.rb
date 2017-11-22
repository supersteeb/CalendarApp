class Todolist < ApplicationRecord
	has_many :todoitems
	scope :today, -> {where(created_at:Date.today).take}
end
