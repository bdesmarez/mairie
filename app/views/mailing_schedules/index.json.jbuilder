json.array!(@mailing_schedules) do |mailing_schedule|
  json.extract! mailing_schedule, :id, :name, :template_id, :city_hall_id, :date, :content
  json.url mailing_schedule_url(mailing_schedule, format: :json)
end
