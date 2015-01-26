require('spec_helper')

describe(Project) do

  describe('#division_id') do
    it('returns the id of the project for each division') do
      test_division = Division.create({:name => "test_division"})
      employee1 = Employee.create({:name => "Philip", :division_id => test_division.id})
      project1 = Project.create({:name => "Project X", :description => "learning databases"})
      expect(project1.division_id()).to(eq(test_division.id()))
    end
  end

end
