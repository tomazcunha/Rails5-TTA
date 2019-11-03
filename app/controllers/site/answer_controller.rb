# class Site::AnswerController < ApplicationController
class Site::AnswerController < SiteController

  def question
    # puts ">>>>>>>>>#{params[:answer_id]}"
    @answer = Answer.find(params[:answer_id]) # assim poderemos verificar se o correct = true na view question
    set_user_statistic(@answer)
  end

  private

  def set_user_statistic(answer)
    if user_signed_in?
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct? ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
      user_statistic.save
    end
      # Verifica se está logado
      # Procura se existir o usuário atual na tabela. Se não existir, cria.
      # Se a resposta estiver correta ou não, soma um dos campos.
      # salva
  end
end
