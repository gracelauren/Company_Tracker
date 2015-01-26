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
  division = Division.create({:name => name, :id => nil})
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
  employee = Employee.create({:name => name, :division_id => division_id})
  @division = Division.find(division_id)
  redirect("/")
end

post("/employees") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  division_id = params.fetch("division_id").to_i()
  employee = Employee.create({:name => name, :division_id => division_id})
  @division = Division.find(division_id)
  erb(:division_employees)
end

get("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_projects)
end

get("/employees/:id/edit") do
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

post("/projects") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  description = params.fetch("description")
  employee_id = params.fetch("employee_id").to_i()
  project = Project.create({:name => name, :description => description, :employee_id => employee_id})
  @employee = Employee.find(employee_id)
  erb(:employee_projects)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end


patch("/projects/:id") do
  name = params.fetch("name").split.map(&:capitalize).join(' ')
  description = params.fetch("description")
  @project = Project.find(params.fetch("id").to_i())
  if params.fetch("name").split.map(&:capitalize).join(' ') != ""
    @project.update({:name => name})
  end
  if params.fetch("description") != ""
    @project.update({:description => description})
  end
  employee_id = @project.employee_id()
  url = "/employees/" + employee_id.to_s()
  redirect(url)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Employee.all()
  division_id = @employee.division_id()
  url = "/employees/" + employee_id.to_s()
  redirect(url)
end
