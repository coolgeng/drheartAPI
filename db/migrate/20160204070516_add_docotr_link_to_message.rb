class AddDocotrLinkToMessage < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.belongs_to :doctor, index: true      
    end        
  end
end
