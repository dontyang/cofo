class WorkerAdvancesController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params] || {status: :unpaid})
    @worker_advances = WorkerAdvance.includes(:worker, :employee).default_where(@search_params.attributes(self)).order(advance_on: :desc).page(params[:page])
  end

  def new
    @worker_advance = WorkerAdvance.new
  end

  def create
    WorkerAdvance.create(worker_advance_params)
    redirect_to action: :index
  end

  def edit
    @worker_advance = WorkerAdvance.find params[:id]
  end

  def update
    @worker_advance = WorkerAdvance.find params[:id]
    @worker_advance.update(worker_advance_params) if @worker_advance.unpaid?
    redirect_to action: :index
  end

  def destroy
    @worker_advance = WorkerAdvance.find params[:id]
    @worker_advance.destroy if @worker_advance.unpaid?
  end

  private

  def worker_advance_params
    params.require(:worker_advance).permit(:worker_id, :amount, :employee_id, :advance_on, :note)
  end

end
