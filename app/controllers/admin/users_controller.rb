class Admin::UsersController < Admin::AdminController

  before_filter :find_user, except: [:index, :new, :create]

  def index
    respond_to do |mime|
      mime.html
      mime.json { render json: { users: User.all.as_json } }
    end
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
    redirect_to [:admin, :users], alert: @user.destroyed? ? nil : 'Error!'
  end

  private

  def find_user
    @user = User.find_by(id: params[:id].to_i)
  end

  def user_params
    params.require(:user).permit(
      :email, :first_name_ru, :last_name_ru, :birthday,:gender, :avatar,
      :info_ru, :password, :password_confirmation, :avatar, :avatar_cache,
      :first_name_en, :last_name_en, :info_en,
      project_users_attributes: [:id, :project_id, :user_id, :_destroy],
      user_links_attributes: [:id, :user_id, :resource_name, :link, :_destroy]
    )
  end
end
