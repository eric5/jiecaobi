class Reputation < ActiveRecord::Base
  attr_accessor :receiver_id, :sender_id, :reason
  validates :receiver, :sender, :reason, presence: true

  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
end
