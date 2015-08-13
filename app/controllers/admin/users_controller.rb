class Admin::UsersController < Admin::AdminController

  before_filter :find_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show; end

  def new; end

  def create
    @user = User.create(user_params)
    if @user.persisted?
      redirect_to [:admin, :users]
    else
      render 'admin/users/_form'
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      redirect_to [:admin, @user]
    else
      render 'admin/users/_form'
    end
  end

  def destroy
    @user.destroy
    if @user.destroyed?
      redirect_to [:admin, :users]
    else
      redirect_to [:admin, :users], alert: 'Error!'
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id].to_i)
  end

  def user_params
    params.require(:user).permit(
      :email, :first_name, :last_name, :birthday,:gender, :avatar,
      :info, :password, :password_confirmation, :avatar, :avatar_cache,
      project_attributes: [:name, :user_id]
    )
  end
end
