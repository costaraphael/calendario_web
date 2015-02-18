class Campus < ActiveRecord::Base
  has_many :calendarios, dependent: :restrict_with_exception

  validates_presence_of :nome, :sigla

  def self.vigentes
    joins(:calendarios).where('calendarios.vigencia <= ?', Time.now)
  end

  def to_s
    "#{sigla} - #{nome}"
  end
end
