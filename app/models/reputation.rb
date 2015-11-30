class Reputation < ActiveRecord::Base
  validates :receiver_id, :sender_id, :reason, presence: true

  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  scope :monthly_limitation, ->(user) { where(sender: user).where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  scope :last_month, -> { where(created_at: Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month) }

  paginates_per 25
end
