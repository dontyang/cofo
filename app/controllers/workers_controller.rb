class WorkersController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params])
    @workers = Worker.default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
  end

  def new
    @worker = Worker.new
  end

  def create
    Worker.create(worker_params)
    redirect_to action: :index
  end

  def edit
    @worker = Worker.find params[:id]
  end

  def update
    @worker = Worker.find params[:id]
    @worker.assign_attributes(worker_params.except(:idcard_front_image, :idcard_back_image))
    @worker.idcard_front_image = worker_params[:idcard_front_image] if worker_params[:idcard_front_image].present?
    @worker.idcard_back_image = worker_params[:idcard_back_image] if worker_params[:idcard_back_image].present?
    @worker.save
    redirect_to action: :index
  end

  private

  def worker_params
    params.require(:worker).permit(:idcard_front_image, :idcard_back_image, :name, :mobile, :idcard_no, :sex, :idcard_address, :bank, :account_no)
  end

end
