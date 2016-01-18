class CreateUserHeartRateJoin < ActiveRecord::Migration
  def change
    change_table :heart_rates do |t|
      t.belongs_to :user, index: true
    end
  end
end
