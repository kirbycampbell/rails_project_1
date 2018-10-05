class User < ApplicationRecord
  has_many :topics
  has_many :statements, through: :topics
  has_many :photos, through: :topics
end
