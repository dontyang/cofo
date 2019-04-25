class WorkerSettlesController < BaseController

  def index
    @search_params = SearchParams.new(params[:search_params])
    @worker_settles = WorkerSettle.default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
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
  end

  def create

  end

end
