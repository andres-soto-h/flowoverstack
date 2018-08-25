class AnswersController < ApplicationController

    before_action :authenticate_user!, except: %i[index show]
    skip_before_action :verify_authenticity_token  

    def new

    end

    def create
        user = current_user
        #binding.pry

        @question = Question.find(params[:question_id])
        @answer=@question.answers.create(answer_params)

        if @answer.save
          redirect_to question_path(params[:question_id]), notice: 'Respuesta añadida correctamente.'
        else
          redirect_to questions_path, alert: 'No se pudo crear la respuesta.'
        end
      end


  private
  
  def answer_params
    params.permit(:description, :question_id)
  end

end
