class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    # helpers
    # puts ">>>>>>>>>>>>> #{devise_controller?}"  # retorna que é o controller atual.
    # puts ">>>>>>>>>>>>> #{resource_class}"      # quem é a classe
    # "application"    # retorna 'application' para o layout

    if devise_controller? && resource_class == Admin
      "admin_devise"  # aplica este layout
    else
      "application"   # layout padrão
    end
  end
end
