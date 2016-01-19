class AddUserId < ActiveRecord::Migration
  def change
    change_table :doctors do |t|
      t.belongs_to :user, index: true
    end    
  end
end
