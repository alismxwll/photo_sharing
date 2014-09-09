class User < ActiveRecord::Base
  has_secure_password
  has_many :tags
  has_many :comments
  validates :email, presence: true
  validates_uniqueness_of :email

  def self.search(find)
    where("email like ?", "%#{find}%")
  end
end






