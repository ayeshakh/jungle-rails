class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence:true
  validates :last_name, presence:true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(TRIM(email)) = ?", email.strip.downcase).first
      if user && user.authenticate(password)
        user
      else
        nil
      end
  end

end

 # authentication is only for login purpose the LOWER and TRIM is used in authentication so it manually downcases
 #the email and removes white space to authenticate but saves the email as the user typed it for the user might have
 # done it on purpose.

 # the case sensitive in validation is only for the creation of new user to see if the new User being created has the
 # same email as any other existing user. it also only down cases it for comparison but does not save it like that.