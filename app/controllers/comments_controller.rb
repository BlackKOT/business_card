class CommentsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers
  include SimpleCaptcha::ViewHelper
  include ActionView::Helpers::FormHelper

  def index
    # @comments = pagination(Comment.order('created_at DESC'), params[:page], 15)
    respond_to do |mime|
      mime.html
      mime.json { render json: {Count: Comment.count, Items: pagination(Comment, params[:page], 5).as_json}}
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save_with_captcha
    render json:  {
      errors: @comment.errors,
      comment_id: @comment.id,
      captcha: generate_simple_captcha_image(object: 'comment')
    }, status: @comment.errors.present? ? 406 :200
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :captcha, :captcha_key)
  end
end
