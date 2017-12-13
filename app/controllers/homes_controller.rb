class HomesController < ApplicationController
	before_action :get_completed_lists, :set_default_todolist

  def index
  	@todoitems = @todolist.todoitems.order(:created_at)
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

  def set_default_todolist
      @todolist = Todolist.today.first || Todolist.create
    end
end
