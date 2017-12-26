class HomesController < ApplicationController
  before_action :set_default_todolist, only: [:index]
	before_action :set_number_of_calendar, :get_completed_lists, only: [:index]

  def index
    # I should refactor these things with PORO services
    h = Todolist.send("last_#{@n_o_calendar}_months")
                .group_by {|l| l.created_at.beginning_of_month.strftime('%Y-%m-%d')}
    current_month = Date.current.month
    current_year  = Date.current.year
    last_year     = Date.current.prev_year.year
    if (1..6).include?(current_month)
      last_year_time = {
          start: 12 - (@n_o_calendar - current_month - 1),
          end: 12
      }
      current_year_time = {
          start: 1,
          end: current_month
      }
      last_year_groups = Hash[(last_year_time[:start]..last_year_time[:end]).map { |month| [ "#{last_year}-#{manipulate(month)}-01", 0 ] }].merge(h)
      current_year_groups = Hash[(current_year_time[:start]..current_year_time[:end]).map { |month| [ "#{current_year}-#{manipulate(month)}-01", 0 ] }].merge(h)
      @list_groups = last_year_groups.merge(current_year_groups)
    else
      month_start = Date.current.prev_month(@n_o_calendar - 1).month
      month_end = Date.current.month
      @list_groups = Hash[(month_start..month_end).map { |month| [ "#{Date.current.year}-#{manipulate(month)}-01", 0 ] }].merge(h)
    end
  	fetch_todoitems if current_user
  end

  private

  def manipulate(month)
    ('0' + month.to_s).last(2)
  end

  def fetch_todoitems
    @todoitems = @todolist.todoitems.order(:created_at)
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
