json.array!(@evento_tipos) do |evento_tipo|
  json.extract! evento_tipo, :id, :nome, :tem_dia_semana, :tem_periodo, :tem_descricao
end
