class Calendario < ActiveRecord::Base
  belongs_to :campus

  def to_s
    nome
  end
end
