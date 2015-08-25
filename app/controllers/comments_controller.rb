class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end

end
