class Todoitem < ApplicationRecord
  belongs_to :todolist
  scope :done, -> { where(is_done: true)}

end
