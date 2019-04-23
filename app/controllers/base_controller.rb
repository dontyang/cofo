class BaseController < ApplicationController

  layout 'employee'
  before_action :authenticate_employee!

end
