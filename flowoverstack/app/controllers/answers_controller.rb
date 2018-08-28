class AnswersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    user = current_user
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    if @answer.save
      redirect_to question_path(params[:question_id]), notice: 'Respuesta añadida correctamente.'
    else
      redirect_to question_path(params[:question_id]), alert: 'La respuesta no debe estar vacia.'
    end
    end

  def ans_vote_up
    user = User.find(params[:user_id])
    @answer = Answer.find(params[:answer_id])
    @question_id=Answer.find(params[:answer_id]).question.id

    if !user.voted_on?(@answer)
      user.vote_exclusively_for(@answer)
      redirect_to question_path(@question_id)
    else
      user.unvote_for(@answer)
      redirect_to question_path(@question_id)
    end
  end

  private

  def answer_params
    params.permit(:description, :answer_id, :user_id)
  end
end
