class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :set_user
  before_action :verify_password, only: [:update]

  def edit
    #console   # execurando o console neste ponto.

    # temos o usuário com o 'set_user'
    @user.build_user_profile if @user.user_profile.blank?
      # Sem o build, os campos não aparecem se estiverem em branco
      # Cria um perfil do usuário para trabalhar-mos.
      # Só cria se o perfil estiver em branco. Caso já estejam cadastrados.
      # build_user_profile, por que o relacionamento é 'has_one'
      # user_profile.build, se fosse 'has_many'

  end

  def update
    if @user.update(params_user)
      # "DESCONTINUADO" sign_in(@user, bypass: true) # para relogar depois de atualizar a senha.
      bypass_sign_in(@user) # nova forma de usar

      # se o params avatar estiver presente, então ele foi atualizado, redireciona para wellcome
      if params_user[:user_profile_attributes][:avatar]
        redirect_to users_backoffice_welcome_index_path, notice: "Avatar atualizado com sucesso!"
      else
        redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso!"
      end

    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  user_profile_attributes:[
                                      :id,
                                      :address,
                                      :gender,
                                      :birthdate,
                                      :avatar
                                  ]
                                )
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
end
