json.array!(@evento_tipos) do |evento_tipo|
  json.extract! evento_tipo, :id, :nome
  json.url evento_tipo_url(evento_tipo, format: :json)
end
