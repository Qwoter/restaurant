class CalendarController < ApplicationController
  def index
    @day = params[:day].blank? ? Time.zone.now.day : params[:day]
    @month = params[:month].blank? ? Time.zone.now.month : params[:month]
    @year = params[:year].blank? ? Time.zone.now.year : params[:year]
    selected_day = Time.new(@year, @month, @day)

    @tables_reservation = Table.get_tables_for_calendar(selected_day)
  end

  def root
  end
end
