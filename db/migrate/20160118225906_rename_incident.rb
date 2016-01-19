class RenameIncident < ActiveRecord::Migration
  def change
    change_table :incidents do |t|
      t.rename :desc, :desp
    end    
  end
end
