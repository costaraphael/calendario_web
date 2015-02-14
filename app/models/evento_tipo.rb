class EventoTipo < ActiveRecord::Base
  def to_s
    nome
  end
end
