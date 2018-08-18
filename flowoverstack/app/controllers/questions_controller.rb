class QuestionsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all
  end

  def show
    @question=Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: 'Pregunta añadida correctamente.'
    else
      redirect_to new_question_path, alert: 'No se pudo crear la pregunta, debe ingresar título y descripción.'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
