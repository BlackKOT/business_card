class CommentsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def index
    @comments = pagination(Comment.order('created_at DESC'), params[:page], 15)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save_with_captcha
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :captcha, :captcha_key)
  end

end
