class EventoTiposController < ApplicationController
  def index
    @evento_tipos = EventoTipo.all
  end
end
