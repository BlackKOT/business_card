class Admin::ProjectsController < Admin::AdminController

  before_filter :find_project, except: [:index, :new, :create]

  def index
    respond_to do |mime|
      mime.html
      mime.json { render json: { projects: Project.all.as_json } }
    end
  end

  def show; end

  def new; end

  def create
    @project = Project.create(project_params)
    if @project.persisted?
      redirect_to [:admin, :projects]
    else
      render 'admin/projects/_form'
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      redirect_to [:admin, @project]
    else
      render 'admin/projects/_form'
    end
  end

  def destroy
    @project.destroy
    if @project.destroyed?
      redirect_to [:admin, :projects]
    else
      redirect_to [:admin, :projects], alert: 'Error!'
    end
  end

  private

  def find_project
    @project = Project.find_by(id: params[:id].to_i)
  end

  def project_params
    params.require(:project).permit(
      :name,
      :company,
      :info_ru, :info_en,
      component_projects_attributes: [:id, :project_id, :component_id, :_destroy],
      images_attributes: [:id, :path, :_destroy]
    )
  end
end
