require('spec_helper')

describe(Project) do

  describe('#division_id') do
    it('returns the id of the project for each division') do
      test_division = Division.create({:name => "test_division"})
      employee1 = Employee.create({:name => "Philip", :division_id => test_division.id})
      project1 = Project.create({:name => "Project X", :description => "learning databases", :division_id => test_division.id})
      expect(project1.division_id()).to(eq(test_division.id()))
    end
  end

  describe(".exists") do
    it("returns all the projects for an employee") do
      test_division = Division.create({:name => "test_division"})
      project_doesnt_exist =Project.create({:name => "comp", :description => "learn", :division_id => test_division.id, :exists => false})
      project1_exists = Project.create({:name => "app", :description => "figure out sinatra", :division_id => test_division.id, :exists => true})
      project2_exists = Project.create({:name => "test", :description => "pass all specs", :division_id => test_division.id, :exists => false})
      projects_exists = [project1_exists, project2_exists]
      project_doesnt_exist = project_doesnt_exist
      expect(Project.exists()).to(eq(projects_exists ))
    end
  end

end
