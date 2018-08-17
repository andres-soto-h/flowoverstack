class QuestionsController < ApplicationController

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
      redirect_to questions_path #, notice:'El producto se creó de manera exitosa.'
    else
      render :new
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