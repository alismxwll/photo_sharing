class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates_uniqueness_of :email
  has_many :tags

  def self.search(find)
    where("email like ?", "%#{find}%")
  end
end






