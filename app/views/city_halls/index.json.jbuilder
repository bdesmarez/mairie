json.array!(@city_halls) do |city_hall|
  json.extract! city_hall, :id, :name, :city, :postalCode
  json.url city_hall_url(city_hall, format: :json)
end
