class EmployeesController < ApplicationController
  def show
    @employee = Employee.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
