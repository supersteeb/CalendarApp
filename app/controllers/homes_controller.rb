class HomesController < ApplicationController
  before_action :set_default_todolist, only: [:index]
	before_action :set_number_of_calendar, :get_completed_lists, only: [:index]

  def index
    h = Todolist.send("last_#{@n_o_calendar}_months")
                .group_by {|l| l.created_at.beginning_of_month.strftime('%Y-%m-%d')}
    month_start = Date.current.prev_month(@n_o_calendar - 1).month
    month_end = Date.current.month
    @list_groups = Hash[(month_start..month_end).map { |month| [ "#{Date.current.year}-#{manipulate(month)}-01", 0 ] }].merge(h)
  	@todoitems = @todolist.todoitems.order(:created_at) if current_user
  end

  private

  def manipulate(month)
    ('0' + month.to_s).last(2)
  end

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

  def set_number_of_calendar
    params[:multiple_calendar] ||= 1
    @n_o_calendar =  params[:multiple_calendar].to_i
  end
end
