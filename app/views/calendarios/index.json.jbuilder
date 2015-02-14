json.array!(@calendarios) do |calendario|
  json.extract! calendario, :id, :campus_id, :nome, :vigencia
  json.url calendario_url(calendario, format: :json)
end
