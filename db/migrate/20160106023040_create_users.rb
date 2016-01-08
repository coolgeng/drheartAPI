class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex
      t.integer :age
      t.string :phone1
      t.string :avatar
      
      t.timestamps null: false
    end
  end  
end
