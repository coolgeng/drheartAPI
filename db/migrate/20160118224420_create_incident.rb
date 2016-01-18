class CreateIncident < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
        t.belongs_to :patient, index: true
        t.timestamps null: false
    end
  end
end
