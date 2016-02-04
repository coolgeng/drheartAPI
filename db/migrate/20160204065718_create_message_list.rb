class CreateMessageList < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :patient, index: true
      t.string :content
      t.integer :occurringTime, :limit => 8
      t.timestamps null: false
    end
  end
end
