class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :check_pagination

  before_action :set_global_params

  private

  def layout_by_resource
    # helpers
    # puts ">>>>>>>>>>>>> #{devise_controller?}"  # retorna que é o controller atual.
    # puts ">>>>>>>>>>>>> #{resource_class}"      # quem é a classe
    # "application"    # retorna 'application' para o layout

    # if devise_controller? && resource_class == Admin
    #   "admin_devise"  # aplica este layout
    # elsif devise_controller? && resource_class == User
    #   "user_devise"
    # else
    #   "application"   # layout padrão
    # end

    # if devise_controller?
    #   "#{resource_class.to_s.downcase}_devise"    # "admin_devise / user_devise"
    # else
    #   "application"   # layout padrão
    # end


    # Podemos adicionar quanto models do Devise for necessário, que o layout sempre vai
    # ser referência do automaticamente.
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"

  end

  def check_pagination
    unless user_signed_in?
      params.extract!(:page)
    end
  end

  def set_global_params
    $global_params = params
  end

end
