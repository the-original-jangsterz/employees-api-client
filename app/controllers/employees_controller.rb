class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("#{ENV['API_BASE_URL']}/employees.json").body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @employee = Unirest.post(
      "#{ENV['API_BASE_URL']}/employees.json",
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
    @employee = Unirest.get("#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json").body
    render 'show.html.erb'
  end

  def edit
    @employee = Unirest.get("#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json").body
    render 'edit.html.erb'
  end

  def update
    @employee = Unirest.patch(
      "#{ENV['API_BASE_URL']}/employees/#{params[:id]}.json",
      headers: { "Accept" => "application/json" },
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
      headers: { "Accept" => "application/json" }
    ).body
    redirect_to "/employees"
  end
end
