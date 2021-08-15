class QuizzesController < ApplicationController
  skip_before_action :set_quiz, only: :index

  def index
    @quizzes = Quiz.all
  end

  def show
    redirect_to_first_step
  end

  def completed; end
end
