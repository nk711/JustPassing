class User < ActiveRecord::Base
  has_many :posts
  has_many :reviews
  #if we delete the user account, the profile account will also be destroyed
  has_one :profile, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
end
