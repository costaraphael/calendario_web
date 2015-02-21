class ApiController < ApplicationController
  respond_to :json

  skip_before_action :check_login

  def campi
    @campi = Campus.vigentes.order(:nome)
  end

  private
  def eventos
    @eventos ||= Evento.from(params[:from].to_i).vigentes(params[:id_campus])
  end

  def removidas
    @removidas ||= if params[:from].to_i == 0
                     []
                   else
                     Evento.from(params[:from].to_i).only_deleted.map(&:id)
                   end
  end

  def last_update
    @last_update ||= if (last_update = Evento.from(params[:from].to_i).with_deleted.last_update) == 0
                       params[:from].to_i
                     else
                       last_update
                     end
  end

  helper_method :eventos, :removidas, :last_update
end
