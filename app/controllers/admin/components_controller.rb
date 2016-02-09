class Admin::ComponentsController < Admin::AdminController

  before_filter :find_component, except: [:index, :create]

  def index
    respond_to do |mime|
      mime.html
      mime.json { render json: { components: Component.all.as_json } }
    end
  end

  def create
    @component = Component.create(component_params)
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
  end

  private

  def find_component
    @component = Component.find_by(id: params[:id].to_i)
  end

  def component_params
    params.require(:component).permit(:name, :type_id)
  end
end
