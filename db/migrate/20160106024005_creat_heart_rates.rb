class CreatHeartRates < ActiveRecord::Migration
  def change
    create_table :heart_rates do |t|
      t.integer :rate      
      t.timestamps null: false
    end
  end
end
