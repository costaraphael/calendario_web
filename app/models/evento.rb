class Evento < ActiveRecord::Base
  belongs_to :calendario
  belongs_to :evento_tipo

  def self.dias_semana
    [
        ['Domingo', 0],
        ['Segunda-Feira', 1],
        ['Terça-Feira', 2],
        ['Quarta-Feira', 3],
        ['Quinta-Feira', 4],
        ['Sexta-Feira', 5],
        ['Sábado', 6],
    ]
  end

  def self.vigentes(campus)
    joins(:calendario).where('calendarios.vigencia <= ? AND calendarios.campus_id = ?', Time.now, campus)
  end
end
