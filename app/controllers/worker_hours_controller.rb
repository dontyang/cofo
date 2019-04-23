class WorkerHoursController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params] || {status: :unpaid})
    @worker_hours = WorkerHour.includes(:worker, :project).default_where(@search_params.attributes(self)).order(id: :desc)
  end

  def new
    @worker_hour = WorkerHour.new(quantity: 1)
  end

  def create
    WorkerHour.create(worker_hour_params)
    redirect_to action: :index
  end

  def edit
    @worker_hour = WorkerHour.find params[:id]
  end

  def update
    @worker_hour = WorkerHour.find params[:id]
    @worker_hour.update(worker_hour_params) if @worker_hour.unpaid?
    redirect_to action: :index
  end

  def destroy
    @worker_hour = WorkerHour.find params[:id]
    @worker_hour.destroy if @worker_hour.unpaid?
  end

  private

  def worker_hour_params
    params.require(:worker_hour).permit(:worker_id, :project_id, :work_on, :work_type, :quantity, :amount)
  end

end
