class CalendariosController < ApplicationController
  load_and_authorize_resource

  before_action :set_calendario, only: [:edit, :update, :destroy]

  # GET /calendarios
  # GET /calendarios.json
  def index
    @calendarios = Calendario.accessible_by(current_ability)
  end

  # GET /calendarios/1
  # GET /calendarios/1.json


  # GET /calendarios/new
  def new
    @calendario = Calendario.new
  end

  # GET /calendarios/1/edit
  def edit
  end

  # POST /calendarios
  # POST /calendarios.json
  def create
    @calendario = Calendario.new(calendario_params)

    respond_to do |format|
      if @calendario.save
        format.html { redirect_to calendarios_path, notice: "Calendário #{@calendario.nome} cadastrado com sucesso." }
        format.json { render :index, status: :created, location: @calendario }
      else
        format.html { render :new }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendarios/1
  # PATCH/PUT /calendarios/1.json
  def update
    respond_to do |format|
      if @calendario.update(calendario_params)
        format.html { redirect_to calendarios_path, notice: "Calendário #{@calendario.nome} atualizado com sucesso" }
        format.json { render :index, status: :ok, location: @calendario }
      else
        format.html { render :edit }
        format.json { render json: @calendario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarios/1
  # DELETE /calendarios/1.json
  def destroy
    @calendario.destroy
    respond_to do |format|
      format.html { redirect_to calendarios_url, notice: "Calendário #{@calendario.nome} removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendario
      @calendario = Calendario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendario_params
      params.require(:calendario).permit(:campus_id, :nome, :vigencia)
    end
end
