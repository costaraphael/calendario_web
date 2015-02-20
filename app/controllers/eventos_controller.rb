class EventosController < ApplicationController
  load_and_authorize_resource

  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  before_action :set_calendario

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = @calendario.eventos.accessible_by(current_ability).order(:inicio).order(:fim)
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = @calendario.eventos.build(evento_params)

    @evento.fim = @evento.inicio if @evento.fim.nil?

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

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
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

  # DELETE /eventos/1
  # DELETE /eventos/1.json
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
    @calendario = Calendario.find(params[:calendario_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:evento_tipo_id, :inicio, :fim, :dia_semana, :descricao)
    end
end
