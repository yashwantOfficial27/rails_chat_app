class User < ApplicationRecord
  has_secure_password

  has_many :messages, dependent: :destroy

  validates :username, presence: true, 
                       uniqueness: true, 
                       length: { minimum: 3, maximum: 20}, 
                       format: {with: /\A[a-zA-Z0-9]+\z/, message: "only letters, numbers, and underscores"}
end
