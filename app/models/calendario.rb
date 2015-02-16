class Calendario < ActiveRecord::Base
  belongs_to :campus
  has_many :eventos

  def to_s
    nome
  end
end
