class Site::WelcomeController < SiteController
  def index
    # @questions = Question.all

    # Corrigindo o problema do n+1. As consultas SQL desnecessárias
    # @questions = Question.includes(:answers)

    # Incluindo a paginação do Kaminari
    # A quantidade de elementos, está config do Model
    @questions = Question.includes(:answers).page(params[:page])
  end
end
