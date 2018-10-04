class User < ApplicationRecord
  has_many :photos
  has_many :statements
end
