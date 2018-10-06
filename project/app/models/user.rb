class User < ApplicationRecord
  has_many :topics
  has_many :statements, through: :topics
  has_many :photos, through: :topics
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true
  before_create :randomize_id

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email
     user.name = auth.info.name
     user.password = 'whatever'
     user.oauth_token = auth.credentials.token
     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
     user.save!
   end
 end


  private
    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Statement.where(id: self.id).exists?
    end
end
