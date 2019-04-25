class WorkerSettlesController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params])
    @worker_settles = WorkerSettle.includes(:worker).default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
  end

  def to_be_settled
    @data = {}
    worker_hours = WorkerHour.find_by_sql "select worker_id,sum(amount) as 'amount' from worker_hours where status = 0 group by worker_id"
    worker_hours.each do |h|
      @data[h.worker_id] = {name: h.worker.name, gong_amount: h.amount, advance_amount: 0}
    end
    worker_advances = WorkerAdvance.find_by_sql "select worker_id,sum(amount) as 'amount' from worker_advances where status = 0 group by worker_id"
    worker_advances.each do |a|
      if @data[a.worker_id].present?
        @data[a.worker_id][:advance_amount] = a.amount
      else
        @data[a.worker_id] = {name: a.worker.name, gong_amount: 0, advance_amount: a.amount}
      end
    end
  end

  def new
    @worker = Worker.find params[:worker_id]
    @worker_hours = @worker.worker_hours.includes(:project).unpaid.order(:work_on)
    @worker_advances = @worker.worker_advances.includes(:employee).unpaid.order(:advance_on)
  end

  def create
    @worker = Worker.find params[:worker_id]
    worker_hours = @worker.worker_hours.includes(:project).unpaid
    worker_advances = @worker.worker_advances.includes(:employee).unpaid
    gong = worker_hours.select{|w| w.gong? }.map{|w| w.quantity.to_f}.sum
    area = worker_hours.select{|w| w.area? }.map{|w| w.quantity.to_f}.sum
    work_amount = worker_hours.map{|w| w.amount.to_f }.sum
    advance_amount = worker_advances.map{|w| w.amount.to_f }.sum
    ActiveRecord::Base.transaction do
      worker_settle = @worker.worker_settles.create(gong: gong, area: area, work_amount: work_amount, advance_amount: advance_amount, amount: (work_amount - advance_amount))
      worker_hours.update_all(status: :paid, worker_settle_id: worker_settle.id)
      worker_advances.update_all(status: :paid, worker_settle_id: worker_settle.id)
    end
    redirect_to action: :index
  end

  def show
    @worker_settle = WorkerSettle.find params[:id]
    @worker = @worker_settle.worker
    @worker_hours = @worker_settle.worker_hours.includes(:project).order(:work_on)
    @worker_advances = @worker_settle.worker_advances.includes(:employee).order(:advance_on)
  end

end
