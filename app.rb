require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get("/") do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end


post("/divisions") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  division = Division.new({:name => name, :id => nil})
  division.save()
  redirect("/")
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_employees)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  erb(:division_employees)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

post("/employees_index") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  division_id = params.fetch("division_id").to_i()
  employee = Employee.new({:name => name, :division_id => division_id})
  employee.save()
  @division = Division.find(division_id)
  redirect("/")
end

post("/employees") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  division_id = params.fetch("division_id").to_i()
  employee = Employee.new({:name => name, :division_id => division_id})
  employee.save()
  @division = Division.find(division_id)
  erb(:division_employees)
end

get("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end


patch("/employees/:id") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  division_id = @employee.division_id()
  url = "/divisions/" + division_id.to_s()
  redirect(url)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  division_id = @employee.division_id()
  url = "/divisions/" + division_id.to_s()
  redirect(url)
end
