require('spec_helper')

describe(Project) do

  describe('#employee_id') do
    it('returns the id of the employee who is working on that project') do
      test_division = Division.create({:name => "test_division"})
      employee1 = Employee.create({:name => "Philip", :division_id => test_division.id})
      project1 = Project.create({:name => "Project X", :description => "learning databases", :employee_id => employee1.id})
      expect(project1.employee_id()).to(eq(employee1.id()))
    end
  end

end
