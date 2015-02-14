class Evento < ActiveRecord::Base
  belongs_to :calendario
  belongs_to :evento_tipo
end
