class AnswersController < ApplicationController

    before_action :authenticate_user!, except: %i[index show]
    skip_before_action :verify_authenticity_token  

    def new

    end

    def create
        user = current_user
        #binding.pry
    
        @answer=Answer.create description: params[:description], user: user, question: params[:id]

        if @answer.save
          redirect_to questions_path, notice: 'Respuesta añadida correctamente.'
        else
          redirect_to questions_path, alert: 'No se pudo crear la respuesta.'
        end
      end


  private
  
  def answer_params
    params.require(:answer).permit(:description, :id)
  end

end
