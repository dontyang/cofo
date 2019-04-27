class ProjectsController < BaseController

  before_action :set_project, only: [:show, :basic_info, :worker, :material, :claiming, :report]

  def index
    @search_params = SearchParams.new(params[:search_params])
    @projects = Project.default_where(@search_params.attributes(self)).order(id: :desc).page(params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)
    redirect_to action: :index
  end

  def show
  end

  def basic_info
    render layout: false
  end

  def worker
    @worker_hours = @project.worker_hours.includes(:worker)
    render layout: false
  end

  def material
    render layout: false
  end

  def claiming
    render layout: false
  end

  def report
    render layout: false
  end

  private

  def set_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:name, :address, :start_on, :sigonggongyi, :area, :xianchang, :yangban, :jihua, :shebei, :sigongshuoming)
  end

end
