class ChangeIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      # t.remove :description, :name
      t.belongs_to :doctor, index: true
      t.string :desc, :treat
      # t.index :part_number
      # t.rename :upccode, :upc_code
      t.integer :status, :time
    end
  end
end
