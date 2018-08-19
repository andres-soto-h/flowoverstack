class CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @question = Question.find(params[:id])
    Comment.create(commentable: @question, text: params[:comment])
    redirect_to question_path(params[:id])
end

  private

  def comment_params
    params.require(:comment).permit(:text, :id)
  end
end
