class ChangePatient < ActiveRecord::Migration
  def change
    change_table :patients do |t|
      t.belongs_to :user, index: true
    end
  end
end
