class UsersBackofficeController < ApplicationController
  before_action :authenticate_user!
  before_action :build_profile        #

  layout 'users_backoffice' # nome do layout

  private

  def build_profile
    # Se estiver em branco, cria uma instância do modelo user_profile associado ao modelo user
    current_user.build_user_profile if current_user.user_profile.blank?
      # O mesmo build para criar os campos em user_profile, so que nesse caso é para criar a campo para incluir o avatar. Para isso, vamos usar o current_user, já disponível pelo Devise, e não o @user do controler(que não estamos usando)
  end
end
