class CreateSession < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :user, index: true
      t.string :session, :token      
      t.timestamps null: false
    end
  end
end
