class User < ApplicationRecord
  has_many :pics
  attr_accessor :custom_field
  has_secure_password

  validates :first_name,
  					presence: true
  validates :last_name,
  					presence: true
  validates :email,
  					presence: true,
  					uniqueness: true,
  					format: {
  						with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  					}

  def to_s
  	"#{first_name} #{last_name}"
  end
  
end
