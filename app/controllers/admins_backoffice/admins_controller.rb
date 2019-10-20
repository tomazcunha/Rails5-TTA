class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    # "admin"=>{"email"=>"amos_oconner@starklarson.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "id"=>"2"}

    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
      # se o adm não passar a senha e a confirmação, então a intenção dele é atualizar só o email,
      # assim, precisamos retirar este dois valores do hash que vai ser feito o update.

    @admin = Admin.find(params[:id])
    params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)

    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado!"
    else
      render :edit  # rederiza novamente edit caso falhe o update
    end
  end
end
