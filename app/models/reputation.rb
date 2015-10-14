class Reputation < ActiveRecord::Base
  validates :receiver_id, :sender_id, :reason, presence: true

  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
end
