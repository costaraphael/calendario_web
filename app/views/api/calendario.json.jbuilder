json.last_update last_update

json.eventos do

  json.array!(eventos) do |evento|

    json.id evento.id

    json.descricao evento.descricao || ''

    json.dataini evento.inicio.strftime('%d-%m-%Y')

    json.datafim evento.fim.strftime('%d-%m-%Y')

    json.tipo evento.evento_tipo_id

    if evento.dia_semana
      json.diasemana evento.dia_semana
    elsif evento.inicio == evento.fim
      json.diasemana evento.inicio.wday
    else
      json.diasemana 0
    end
  end

end

json.removidas removidas