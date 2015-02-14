class EventoTiposController < ApplicationController
  before_action :set_evento_tipo, only: [:show, :edit, :update, :destroy]

  # GET /evento_tipos
  # GET /evento_tipos.json
  def index
    @evento_tipos = EventoTipo.all
  end

  # GET /evento_tipos/1
  # GET /evento_tipos/1.json
  def show
  end

  # GET /evento_tipos/new
  def new
    @evento_tipo = EventoTipo.new
  end

  # GET /evento_tipos/1/edit
  def edit
  end

  # POST /evento_tipos
  # POST /evento_tipos.json
  def create
    @evento_tipo = EventoTipo.new(evento_tipo_params)

    respond_to do |format|
      if @evento_tipo.save
        format.html { redirect_to @evento_tipo, notice: 'Evento tipo was successfully created.' }
        format.json { render :show, status: :created, location: @evento_tipo }
      else
        format.html { render :new }
        format.json { render json: @evento_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evento_tipos/1
  # PATCH/PUT /evento_tipos/1.json
  def update
    respond_to do |format|
      if @evento_tipo.update(evento_tipo_params)
        format.html { redirect_to @evento_tipo, notice: 'Evento tipo was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento_tipo }
      else
        format.html { render :edit }
        format.json { render json: @evento_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evento_tipos/1
  # DELETE /evento_tipos/1.json
  def destroy
    @evento_tipo.destroy
    respond_to do |format|
      format.html { redirect_to evento_tipos_url, notice: 'Evento tipo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento_tipo
      @evento_tipo = EventoTipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_tipo_params
      params.require(:evento_tipo).permit(:nome)
    end
end
