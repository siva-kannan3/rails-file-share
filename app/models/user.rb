class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable

  has_many :documents

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :username, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true

  

validates :password,   
  presence: true,
  format: { with: PASSWORD_FORMAT, message: "should be atleast 8 charcter or more, must contain a digit, must contain a lower lower case character, must contain an upper case character, must contain a symbol" }, 
  on: :create 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :authentication_keys => [:username]
end
