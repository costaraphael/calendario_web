class CalendariosController < ApplicationController
  load_and_authorize_resource

  before_action :set_calendario, only: [:edit, :update, :destroy]

  def index
    @calendarios = Calendario.accessible_by(current_ability)
  end

  def new
    @calendario = Calendario.new
  end

  def edit
  end

  def create
    @calendario = Calendario.new(calendario_params)

    @calendario.campus = current_user.campus if cannot? :manage, Campus

    respond_to do |format|
      if @calendario.save
        format.html { redirect_to calendarios_path, notice: "Calendário #{@calendario.nome} cadastrado com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @calendario.update(calendario_params)
        format.html { redirect_to calendarios_path, notice: "Calendário #{@calendario.nome} atualizado com sucesso" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    begin
      @calendario.destroy
      respond_to do |format|
        format.html { redirect_to calendarios_url, notice: "Calendário #{@calendario.nome} removido com sucesso." }
      end
    rescue ActiveRecord::DeleteRestrictionError
      respond_to do |format|
        format.html { redirect_to calendarios_url, notice: "O calendário #{@calendario.campus.sigla} - #{@calendario.nome} não pôde ser removido pois existem eventos registrados para ele." }
      end
    end
  end

  private
  def set_calendario
    @calendario = Calendario.find(params[:id])
  end

  def calendario_params
    params.require(:calendario).permit(:campus_id, :nome, :vigencia)
  end
end
