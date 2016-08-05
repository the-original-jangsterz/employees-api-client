class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @employee = Unirest.post(
      "http://localhost:3000/api/v1/employees.json",
      headers: { "Accept" => "application/json" },
      parameters: {
        first_name: params[:form_input_first_name],
        last_name: params[:form_input_last_name],
        email: params[:form_input_email]
      }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def show
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
    render 'show.html.erb'
  end
end
