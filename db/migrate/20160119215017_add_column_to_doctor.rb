class AddColumnToDoctor < ActiveRecord::Migration
  def change
    change_table :doctors do |t|
      t.string :name, :phone, :avatar, :hospital, :sector, :position
      t.integer :sex, :age
    end    
  end
end
