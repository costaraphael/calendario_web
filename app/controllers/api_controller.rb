class ApiController < ApplicationController
  respond_to :json

  def campi
    @campi = Campus.vigentes
  end

  def calendario
    @eventos = Evento.vigentes(params[:id_campus])
  end
end
