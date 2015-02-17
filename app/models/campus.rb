class Campus < ActiveRecord::Base
  has_many :calendarios

  def self.vigentes
    joins(:calendarios).where('calendarios.vigencia <= ?', Time.now)
  end

  def to_s
    "#{sigla} - #{nome}"
  end
end
