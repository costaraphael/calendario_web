class ApiController < ApplicationController
  respond_to :json

  skip_before_action :check_login

  def campi
    @campi = Campus.vigentes
  end

  def calendario
    @eventos = Evento.vigentes(params[:id_campus])
  end
end
