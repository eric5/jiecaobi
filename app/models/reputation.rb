class Reputation < ActiveRecord::Base
  validates :receiver_id, :sender_id, :reason, presence: true

  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  scope :monthly_limitation, ->(user) { where(sender: user).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month) }
end
