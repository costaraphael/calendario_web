class Calendario < ActiveRecord::Base
  belongs_to :campus
  has_many :eventos, dependent: :restrict_with_exception

  validates_presence_of :nome, :vigencia, :campus

  def to_s
    nome
  end
end
