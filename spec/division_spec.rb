require('spec_helper')

describe(Division) do
  it("tells which employees are in it") do
    test_division = Division.create({:name => "test_division"})
    employee1 = Employee.create({:name => "Kateri", :division_id => test_division.id})
    employee2 = Employee.create({:name => "Mira", :division_id => test_division.id})
    expect(test_division.employees()).to(eq([employee1, employee2]))
  end

  it("tells which projects are in it") do
    test_division = Division.create({:name => "test_division"})
    project1 = Project.create({:name => "app", :description => "figure out sinatra", :division_id => test_division.id})
    project2 = Project.create({:name => "test", :description => "pass all specs", :division_id => test_division.id})
    expect(test_division.projects()).to(eq([project1, project2]))
  end
end
