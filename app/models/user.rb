class User < ApplicationRecord
  has_many :dishes
  
  before_save { self.email.downcase! }
  validates :name,  presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  has_secure_password
end
