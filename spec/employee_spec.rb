require('spec_helper')

describe(Employee) do

  describe('#division_id') do
    it('returns the id of the division the employee is in') do
      test_division = Division.create({:name => "test_division"})
      employee1 = Employee.create({:name => "Kateri", :division_id => test_division.id})
      expect(employee1.division_id()).to(eq(test_division.id()))
    end
  end

end
