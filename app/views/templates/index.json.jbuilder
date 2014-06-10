json.array!(@templates) do |template|
  json.extract! template, :id, :name, :body
  json.url template_url(template, format: :json)
end
