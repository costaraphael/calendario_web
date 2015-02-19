class Usuario < ActiveRecord::Base

  validates :senha, confirmation: {message: '^Os campos senha e confirmar senha devem ser iguais'}
  validates :senha, presence: {message: 'não pode ser nulo'}
  validates :login, presence: {message: 'não pode ser nulo'}
  validates :campus, presence: {message: 'não pode ser nulo'}
  validates :login, uniqueness: {message: 'informado já está sendo utilizado'}
  validates :nome, presence: {message: 'não pode ser nulo'}

  belongs_to :campus

  def to_s
    self.nome
  end
end
