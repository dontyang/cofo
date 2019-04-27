class VendorsController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params])
    @vendors = Vendor.default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    Vendor.create(vendor_params)
    redirect_to action: :index
  end

  def edit
    @vendor = Vendor.find params[:id]
  end

  def update
    @vendor = Vendor.find params[:id]
    @vendor.update(vendor_params)
    redirect_to action: :index
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :address, :contact, :mobile, :tax_no, :bank, :bank_account_no, :tel, :fax)
  end

end
