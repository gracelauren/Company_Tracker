class CreateEmployeesAndProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects, id: false do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :project, index: true
    end
  end
end
