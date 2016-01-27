class RenameStatusIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      t.rename(:status, :state)
    end
  end
end
