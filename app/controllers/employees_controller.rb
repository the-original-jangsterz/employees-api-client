class EmployeesController < ApplicationController
  HEADERS = { "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL'] }

  def index
    @employees = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees.json",
      headers: HEADERS
    ).body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @employee = Unirest.post(
      "#{ENV['API_BASE_URL']}/employees.json",
      headers: HEADERS,
      parameters: {
        first_name: params[:form_input_first_name],
        last_name: params[:form_input_last_name],
        email: params[:form_input_email]
      }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def show
    employee_hash = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json",
      headers: HEADERS
    ).body
    @employee = Employee.new(employee_hash)
    render 'show.html.erb'
  end

  def edit
    @employee = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json",
      headers: HEADERS
    ).body
    render 'edit.html.erb'
  end

  def update
    @employee = Unirest.patch(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json",
      headers: HEADERS,
      parameters: {
        first_name: params[:form_input_first_name],
        last_name: params[:form_input_last_name],
        email: params[:form_input_email],
        birthdate: params[:form_input_birthdate]
      }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    message = Unirest.delete(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json",
      headers: HEADERS
    ).body
    redirect_to "/employees"
  end
end
