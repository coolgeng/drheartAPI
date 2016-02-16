class AddVerifyCode < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :verify_code
      t.integer :verify_time, :limit => 8
    end    
  end
end
