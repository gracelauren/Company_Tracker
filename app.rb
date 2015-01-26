require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  @employee = Employee.name({:name => name, :division_id => division_id })
  @employee.save()
  redirect('/')
end
