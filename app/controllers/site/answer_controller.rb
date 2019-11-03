class Site::AnswerController < SiteController

  def question
    # puts ">>>>>>>>>#{params[:answer_id]}"
    @answer = Answer.find(params[:answer_id]) # assim poderemos verificar se o correct = true na view question

    # set_user_statistic(@answer)
    UserStatistic.set_statistic(@answer, current_user)
      # Agora o modelo vai ser responsável por essa ação
  end

end
