class Topic < ApplicationRecord
  belongs_to :user
  has_many :statements
  has_many :photos
end
