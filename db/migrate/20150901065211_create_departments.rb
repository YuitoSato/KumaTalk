class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :key
      t.timestamps null: false
    end
  end
end
