class ProjectsController < BaseController

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

  private

  def project_params
    params.require(:project).permit(:name, :address, :start_on, :sigonggongyi, :area, :xianchang, :yangban, :jihua, :shebei, :sigongshuoming)
  end

end
