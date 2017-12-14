class Defaultitem < ApplicationRecord
	enum state: {active: 0, inactive: 1}
	validates :name, presence: true
end
