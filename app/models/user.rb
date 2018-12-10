class User < ActiveRecord::Base
  #if we delete the user account, the posts will also be destroyed
  has_many :posts, dependent: :destroy
  #if we delete the user account, the reviews will also be destroyed
  has_many :reviews, dependent: :destroy
  #if we delete the user account, the profile account will also be destroyed
  has_one :profile, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
