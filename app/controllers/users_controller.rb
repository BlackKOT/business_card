class UsersController < ApplicationController
  def index
    respond_to do |mime|
      mime.html
      mime.json { render json: { users: User.order(:id).as_json } }
    end
  end

  def show
    @user = User.find_by(id: params[:id].to_i)
  end
end
