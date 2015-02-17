json.array!(@campi) do |campus|
  json.id campus.id
  json.nome campus.sigla
end
