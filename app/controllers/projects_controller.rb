class ProjectsController < ApplicationController
  before_filter :find_user

  def index
    @projects = @user.projects
  end

  def show
    @projects = @user.projects.find_by(id: params[:id].to_i)
  end

  private

  def find_user
    redirect_to :root unless (@user = User.find_by(id: params[:user_id].to_i))
  end
end
