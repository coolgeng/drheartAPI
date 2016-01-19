class RemoveNameFromUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name, :sex, :age, :phone1, :avatar
    end

  end
end
