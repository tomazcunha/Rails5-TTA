# class Site::SearchController < ApplicationController
class Site::SearchController < SiteController
  def questions
    # @questions = Question.all
    # @questions = Question.includes(:answers).page(params[:page])

    # @questions = Question.includes(:answers).where(description: params[:term])
      # SELECT "questions".* FROM "questions" WHERE "questions"."description" = ?  [["description", "Qui"]]

    # Modo como está no SQL
    # @questions = Question.includes(:answers).where("description = ?", params[:term])

    # Modo como está no SQL, agora usando o LIKE
    # @questions = Question.includes(:answers).where("description LIKE ?", params[:term])
      # SELECT "questions".* FROM "questions" WHERE (description LIKE 'Qui')

    # Interpolando com coringa '%' para retornar os registros que contenha o termo
    # @questions = Question.includes(:answers).where("description LIKE ?", "%#{params[:term]}%")
      # SELECT "questions".* FROM "questions" WHERE (description LIKE '%Qui%')

    # Transformando as palavras em minúsculas.
    # Dependendo do banco de dados, vai ser ignorado ou não as letras maúculas e minúsculas.
    # lower() é uma função d banco de dados
    @questions = Question.includes(:answers)
      .where("lower(description) LIKE ?", "%#{params[:term].downcase}%")
      .page(params[:page])
      # SELECT "questions".* FROM "questions" WHERE (lower(description) LIKE '%velit%')

  end
end
