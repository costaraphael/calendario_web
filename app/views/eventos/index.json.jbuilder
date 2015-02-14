json.array!(@eventos) do |evento|
  json.extract! evento, :id, :calendario_id, :evento_tipo_id, :inicio, :fim, :dia_semana, :descricao
  json.url evento_url(evento, format: :json)
end
