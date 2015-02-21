class ApiController < ApplicationController
  respond_to :json

  skip_before_action :check_login

  def campi
    @campi = Campus.vigentes.order(:nome)
  end

  def calendario
    @eventos = Evento.vigentes(params[:id_campus])
    @last_update = @eventos.map {|e| e.updated_at.to_i} .max
  end
end
