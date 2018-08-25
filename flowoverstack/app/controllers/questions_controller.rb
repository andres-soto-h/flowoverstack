class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index

    if params[:terms].present?
      @questions = Question.where("title LIKE (?) OR body LIKE (?)", "%#{params[:terms]}%", "%#{params[:terms]}%")
    else
      @questions = Question.all.order(created_at: :desc)
    end

  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @question = Question.find(params[:id])
    @answer = Answer.all.where(question_id: params[:id])
  end

  def new
    user = current_user
    @question = user.questions.new
  end

  def create
    user = current_user
    @question = user.questions.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Pregunta añadida correctamente.'
    else
      redirect_to new_question_path, alert: 'No se pudo crear la pregunta, debe ingresar título y descripción.'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
