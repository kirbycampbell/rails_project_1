class User < ApplicationRecord
  has_many :topics
  has_many :statements, through: :topics
  has_many :photos, through: :topics
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
