class EventosController < ApplicationController
  load_and_authorize_resource

  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :set_calendario

  def index
    @eventos = @calendario.eventos.order(:inicio).order(:fim)
  end

  def show
  end

  def new
    @evento = @calendario.eventos.build
  end

  def edit
  end

  def create
    @evento = @calendario.eventos.build(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to calendario_eventos_path, notice: 'Evento cadastado com sucesso.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to calendario_eventos_path, notice: 'Evento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to calendario_eventos_path, notice: 'Evento removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  def set_evento
    @evento = Evento.find(params[:id])
  end

  def set_calendario
    @calendario = Calendario.accessible_by(current_ability).find(params[:calendario_id])
  end

  def evento_params
    params.require(:evento).permit(:evento_tipo_id, :inicio, :fim, :dia_semana, :descricao)
  end
end
