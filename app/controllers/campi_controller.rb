class CampiController < ApplicationController
  before_action :set_campus, only: [:show, :edit, :update, :destroy]

  # GET /campi
  # GET /campi.json
  def index
    @campi = Campus.all
  end

  # GET /campi/1
  # GET /campi/1.json


  # GET /campi/new
  def new
    @campus = Campus.new
  end

  # GET /campi/1/edit
  def edit
  end

  # POST /campi
  # POST /campi.json
  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to campi_path, notice: "Câmpus #{@campus.sigla} criado com sucesso." }
      else
        format.html { render :new }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campi/1
  # PATCH/PUT /campi/1.json
  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to campi_path, notice: "Câmpus #{@campus.sigla} atualizado com sucesso." }
      else
        format.html { render :edit }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campi/1
  # DELETE /campi/1.json
  def destroy
    @campus.destroy
    respond_to do |format|
      format.html { redirect_to campi_url, notice: "Câmpus #{@campus.sigla} removido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus
      @campus = Campus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campus_params
      params.require(:campus).permit(:nome, :sigla)
    end
end
