class HomesController < ApplicationController
	before_action :get_completed_lists
  def index
  end

  private

  def get_completed_lists
    @completed_lists = Todolist.where(percent: 100)
    @events = []
    @completed_lists.each do |list|
      @events << {
        name: list.id,
        start: list.created_at
      }
    end
  end
end
