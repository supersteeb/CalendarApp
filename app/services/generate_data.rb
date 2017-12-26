class GenerateData
	def initialize
		@n_o_calendar = 3
		new_time = Time.local(2018, 1, 1, 12, 0, 0)
		Timecop.travel(new_time)
	end

	def test
        new_time = Time.local(2018, 1, 1, 12, 0, 0)
        Timecop.travel(new_time)
        h = Todolist.send("last_#{@n_o_calendar}_months")
                    .group_by {|l| l.created_at.beginning_of_month.strftime('%Y-%m-%d')}
        current_month = Date.current.month
        current_year  = Date.current.year
        last_year     = Date.current.prev_year.year
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
        puts "\n\n\n #{@list_groups} \n\n\n"
	end

	def manipulate(month)
        ('0' + month.to_s).last(2)
    end
end
