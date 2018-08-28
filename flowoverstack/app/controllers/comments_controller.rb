class CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    if params[:type]=='Question'
      @res = Question.find(params[:id])
    else
      @res = Answer.find(params[:id])
    end

    Comment.create(commentable: @res, text: params[:comment])
    redirect_to question_path(params[:val_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :id, :type, :val_id)
  end
end
