class Admin::ComponentsController < Admin::AdminController

  before_filter :find_component, except: [:index, :create]

  def index
    @components = Component.all
  end

  def create
    @component = Component.create(component_params)
    if @component.persisted?
      redirect_to [:admin, :components]
    else
      render 'admin/components/_form'
    end
  end

  def edit; end

  def update
    if @component.update_attributes(component_params)
      redirect_to [:admin, @component]
    else
      render 'admin/components/_form'
    end
  end

  def destroy
    @component.destroy
    if @component.destroyed?
      redirect_to [:admin, :components]
    else
      redirect_to [:admin, :components], alert: 'Error!'
    end
  end

  private

  def find_component
    @component = Component.find_by(id: params[:id].to_i)
  end

  def component_params
    params.require(:component).permit(:name, :type_id)
  end
end
