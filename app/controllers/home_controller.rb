class HomeController < ApplicationController
  def index
  end

  def dados_pessoais
    @usuario = @active_user.clone
    @usuario.senha = nil
  end

  def salvar_dados_pessoais

    params = dados_pessoais_params
    logger.info params[:senha]

    if params[:senha].empty?
      params.except! :senha, :senha_confirmation
    else
      senha_confirmada = params[:senha_confirmation] == params[:senha]

      params[:salt] = Digest::SHA1.hexdigest("#{Time.now.utc}--#{params[:senha]}")
      params[:senha] = Digest::SHA1.hexdigest("#{params[:salt]}--#{params[:senha]}")
      params[:senha_confirmation] = params[:senha] if senha_confirmada

    end

    respond_to do |format|
      @usuario = Usuario.find @active_user.id
      if @usuario.update(params)
        format.html { redirect_to root_path, notice: 'Dados pessoais atualizados com sucesso.' }
      else
        format.html { render :dados_pessoais }
      end
    end
  end

  private
  def login_params
    params.require(:login).permit(:login, :senha)
  end

  def dados_pessoais_params
    params.require(:usuario).permit(:nome, :senha, :senha_confirmation)
  end
end
