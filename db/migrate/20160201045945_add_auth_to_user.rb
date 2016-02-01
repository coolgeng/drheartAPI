class AddAuthToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :password_digest, :password_confirmation, :password_salt, :email, :email_confirmation
    end    
  end
end
