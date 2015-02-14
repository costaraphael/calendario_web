json.array!(@campi) do |campus|
  json.extract! campus, :id, :nome, :sigla
  json.url campus_url(campus, format: :json)
end
