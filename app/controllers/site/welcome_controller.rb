class Site::WelcomeController < SiteController
  def index
    # @questions = Question.all

    # Corrigindo o problema do n+1. As consultas SQL desnecessárias
    # @questions = Question.includes(:answers)

    # Incluindo a paginação do Kaminari
    # A quantidade de elementos, está config do Model
    # @questions = Question.includes(:answers).page(params[:page])


    # Ordenando por 'created_at'
    # @questions = Question.includes(:answers).order(:created_at).page(params[:page])

    # Informando para o SQL a ordem
    # @questions = Question.includes(:answers).order('created_at asc').page(params[:page])
    # @questions = Question.includes(:answers).order('created_at desc').page(params[:page])

    # Alterando para chamar o método de classe
    @questions = Question.last_questions(params[:page])


  end
end
