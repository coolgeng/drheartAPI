class Message < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :user
  
  def self.filter_by_time(id, time)
    Message.where("user_id = ? and occurringTime > ?", id, time)
  end
end