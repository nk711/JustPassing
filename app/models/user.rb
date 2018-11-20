class User < ActiveRecord::Base
  include Clearance::User
  attr_accesible :Firstname
  attr_accesible :lastname
  attr_accesible :number
end
