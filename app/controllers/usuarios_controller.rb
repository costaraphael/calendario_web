class UsuariosController < ApplicationController
  load_and_authorize_resource

  before_action :set_usuario, only: [:edit, :update, :destroy]

  def index
    @usuarios = Usuario.accessible_by(current_ability)
  end

  def show
  end

  def new
    @usuario = Usuario.new
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)

    senha_confirmada = @usuario.senha_confirmation == @usuario.senha

    @usuario.salt = Digest::SHA1.hexdigest("#{Time.now.utc}--#{@usuario.senha}")
    @usuario.senha = Digest::SHA1.hexdigest("#{@usuario.salt}--#{@usuario.senha}")
    @usuario.ativo = true

    @usuario.senha_confirmation = @usuario.senha if senha_confirmada

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_path, notice: 'Usuário criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_path, notice: 'Usuário atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuário removido com sucesso.' }
    end
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def usuario_params
      params.require(:usuario).permit(:nome, :login, :senha, :salt, :ativo, :admin, :campus_id, :senha_confirmada)
    end
end
