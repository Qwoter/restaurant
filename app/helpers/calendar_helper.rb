module CalendarHelper
  def format_date(day, month, year)
    "#{'%02d' % day}-#{'%02d' % month}-#{year}"
  end

  def show_tables_timeline(reservations = 0)
    result = 24.times.collect{|i| i}

    reservations.each do |r|
      if r[1] - r[0] == 1
        result[r[0]] = "<span class='red'>[#{result[r[0]]}]</span>"
      else
        result[r[0]] = "<span class='red'>[#{result[r[0]]}"
        result[r[1] - 1] = "#{result[r[1] - 1]}]</span>"
      end
    end

    (result * " ").html_safe
  end

  def link_to_next_day(day, month, year)
    next_day = Time.new(year.to_i, month.to_i, day.to_i) + 1.day
    link_to("Next Day", calendar_path({day: next_day.day, month: next_day.month, year: next_day.year}))
  end

  def link_to_previous_day(day, month, year)
    prev_day = Time.new(year.to_i, month.to_i, day.to_i) - 1.day

    if prev_day >= Time.now.beginning_of_day
      link_to("Previous Day", calendar_path({day: prev_day.day, month: prev_day.month, year: prev_day.year}))
    end
  end
end
