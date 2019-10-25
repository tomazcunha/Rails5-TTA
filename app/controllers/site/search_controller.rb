# class Site::SearchController < ApplicationController
class Site::SearchController < SiteController
  def questions
    # @questions = Question.all
    @questions = Question.includes(:answers).page(params[:page])
  end
end
