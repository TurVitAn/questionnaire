class StepsController < ApplicationController
  def show_questions
    @step = @quiz.steps.find_by(position: params[:step_position])
    return redirect_to_first_step unless @step

    @result = @quiz.results&.find_by(uid: params[:uid])
  end

  def save_answers
    @validation_errors = {}
    params[:questions].each do |question_id, value|
      @question= Question.find(question_id)

      value.shift if @question.answer_type == 'CHECKBOXES'
      value.strip! if @question.answer_type == 'STRING'

      @validation_errors[question_id] = validate_value(@question, value)
      if @validation_errors[question_id].nil?
        result = Result.find_or_create_by(uid: params[:uid], quiz_id: @quiz.id)
        answer = Answer.find_or_create_by(result_id: result.id, question_id: question_id)
        answer.update(value: value) unless answer.value == value
      end
    end

    step_position = params[:step_position].to_i

    if @validation_errors.values.any?
      @step = @quiz.steps.find_by(position: params[:step_position])
      @result = @quiz.results&.find_by(uid: params[:uid])
      return render :show_questions
    end

    return redirect_to completed_quiz_path(@quiz.slug) if last_step?(step_position)

    redirect_to "/quizzes/#{ @quiz.slug }/#{params[:uid]}/steps/#{ step_position + 1 }"
  end

  private

  def last_step?(step_position)
    @quiz.steps.order(:position).last.position == step_position
  end

  def validate_value(question, value)
    if question.answer_required
      return {presence: false} unless value.present?
    end

    if question.answer_type == 'STRING' && question.min_value && question.max_value &&
      !value.length.between?(question.min_value, question.max_value)
      return {length: false}
    end

    if question.answer_type == 'INTEGER' && question.min_value && question.max_value &&
      !value.to_i.between?(question.min_value, question.max_value)
      return {span: false}
    end
    nil
  end
end
