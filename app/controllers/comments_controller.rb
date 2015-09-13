class CommentsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  respond_to :json, only: :create

  def index
    # @comments = pagination(Comment.order('created_at DESC'), params[:page], 15)
    respond_to do |mime|
      mime.html
      mime.json { render json: { comments: Comment.all.as_json } }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save_with_captcha
    render json:  {errors: @comment.errors.full_messages, comment_id: @comment.id}
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :captcha, :captcha_key)
  end
end
