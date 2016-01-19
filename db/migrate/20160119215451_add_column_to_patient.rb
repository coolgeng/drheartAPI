class AddColumnToPatient < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.string :name, :phone, :avatar
      t.integer :sex, :age
    end        
  end
end
