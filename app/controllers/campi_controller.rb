class CampiController < ApplicationController
  load_and_authorize_resource

  before_action :set_campus, only: [:edit, :update, :destroy]

  def index
    @campi = Campus.all
  end

  def new
    @campus = Campus.new
  end

  def edit
  end

  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to campi_path, notice: "Câmpus #{@campus.sigla} criado com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to campi_path, notice: "Câmpus #{@campus.sigla} atualizado com sucesso." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    begin
      @campus.destroy
      respond_to do |format|
        format.html { redirect_to campi_url, notice: "Câmpus #{@campus.sigla} removido com sucesso." }
      end
    rescue ActiveRecord::DeleteRestrictionError
      respond_to do |format|
        format.html { redirect_to campi_url, notice: "O câmpus #{@campus.sigla} não pôde ser removido pois existem calendários registrados para ele." }
      end
    end
  end

  private
    def set_campus
      @campus = Campus.find(params[:id])
    end

    def campus_params
      params.require(:campus).permit(:nome, :sigla)
    end
end
