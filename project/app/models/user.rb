class User < ApplicationRecord
  has_many :photos
  has_many :statements, through: :topics
  has_many :photos, through: :topics
end
