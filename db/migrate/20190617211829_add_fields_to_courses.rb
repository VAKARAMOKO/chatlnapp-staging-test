class AddFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :level_course, :string
    add_column :courses, :material_course, :string
  end
end
