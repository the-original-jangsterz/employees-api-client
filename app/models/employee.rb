class Employee
  HEADERS = { "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL'] }

  attr_accessor :id, :first_name, :last_name, :email, :birthdate, :addresses

  def initialize(input_options)
    @id = input_options["id"]
    @first_name = input_options["firstName"]
    @last_name = input_options["lastName"]
    @email = input_options["email"]
    @birthdate = input_options["birthdate"]
    @addresses = input_options["addresses"]
  end

  def self.all
    employee_hashes = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees.json",
      headers: HEADERS
    ).body
    employees = []
    employee_hashes.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    employees
  end

  def self.find_by(input_options)
    id = input_options[:id]
    employee_hash = Unirest.get(
      "#{ENV['API_BASE_URL']}/employees/#{id}.json",
      headers: HEADERS
    ).body
    Employee.new(employee_hash)
  end
end
