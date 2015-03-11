class Evento < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :calendario
  belongs_to :evento_tipo

  validates_presence_of :evento_tipo, :calendario, :inicio, :fim

  validates_presence_of :dia_semana, if: -> (evento) { evento.evento_tipo.nil? or evento.evento_tipo.tem_dia_semana }

  before_validation :set_dia_fim

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

  def self.from(timestamp)
    self.where('eventos.updated_at > ?', Time.at(timestamp))
  end

  def self.last_update
    self.pluck('MAX(updated_at)').first.to_i
  end

  def dia_semana_nome
    self.class.dias_semana.to_h.invert[self.dia_semana]
  end

  private
  def set_dia_fim
    self.fim = self.inicio unless self.evento_tipo.tem_periodo
  end
end
