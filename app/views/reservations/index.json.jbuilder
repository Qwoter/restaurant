json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :table_id, :start_time, :end_time, :additional_info
  json.url reservation_url(reservation, format: :json)
end
