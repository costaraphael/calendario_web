class ApiController < ApplicationController
  respond_to :json

  skip_before_action :check_login

  def campi
    @campi = Campus.vigentes.order(:nome)
  end

  def calendario
    @eventos = Evento.from(params[:from].to_i).vigentes(params[:id_campus])
    @removidas = Evento.from(params[:from].to_i).only_deleted.map &:id
    @last_update = Evento.from(params[:from].to_i).with_deleted.last_update
  end
end
