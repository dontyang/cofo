class MaterialsController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params] || {status: :unpaid})
    @materials = Material.includes(:vendor, :project).default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
  end

  def new
    @material = Material.new
  end

  def create
    Material.create(material_params)
    redirect_to action: :index
  end

  def edit
    @material = Material.find params[:id]
  end

  def update
    @material = Material.find params[:id]
    @material.update(material_params) if @material.unpaid?
    redirect_to action: :index
  end

  def destroy
    @material = Material.find params[:id]
    @material.destroy if @material.unpaid?
  end

  private

  def material_params
    params.require(:material).permit(:vendor_id, :project_id, :name, :quantity, :unit, :amount, :purchase_on, :note)
  end

end
