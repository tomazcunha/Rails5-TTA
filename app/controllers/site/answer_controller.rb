# class Site::AnswerController < ApplicationController
class Site::AnswerController < SiteController

  def question
    # puts ">>>>>>>>>#{params[:answer_id]}"

    @answer = Answer.find(params[:answer_id])
    # assim poderemos verificar se o corret = true na view question

  end
end
