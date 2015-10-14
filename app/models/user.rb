class User < ActiveRecord::Base
  validates :email, :password, :name, presence: true
  validates :email, uniqueness: true

  has_many :reputations, foreign_key: :receiver_id

  has_secure_password
end
