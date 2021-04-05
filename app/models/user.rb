class User < ActiveRecord::Base

 

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: { case_sensitive: true }

  def self.authenticate_with_credentials(email, password)
    # new_email = email.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
