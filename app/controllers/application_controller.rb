class ApplicationController < ActionController::Base
  before_action :set_quiz

  private

  def set_quiz
    @quiz = Quiz.find_by(slug: params[:slug])
    redirect_to 'quizzes#index' unless @quiz
  end

  def redirect_to_first_step
    uid = "uid#{Time.now.to_i.to_s}"
    redirect_to "/quizzes/#{@quiz.slug}/#{uid}/steps/1"
  end
end
