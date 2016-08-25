class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @employee = Employee.create(
      first_name: params[:form_input_first_name],
      last_name: params[:form_input_last_name],
      email: params[:form_input_email]
    )
    redirect_to "/employees/#{@employee.id}"
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    @employee.update(
      first_name: params[:form_input_first_name],
      last_name: params[:form_input_last_name],
      email: params[:form_input_email],
      birthdate: params[:form_input_birthdate]
    )
    redirect_to "/employees/#{@employee.id}"
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    redirect_to "/employees"
  end
end
