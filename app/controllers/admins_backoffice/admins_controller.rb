class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    admin = Admin.find(params[:id]) # variavel local se @
    params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)

    if admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado!"
    else
      render :edit  # rederiza novamente edit caso falhe o update
    end
  end
end
