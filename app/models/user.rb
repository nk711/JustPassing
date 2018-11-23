class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :Firstname
  attr_accessor :Lastname
  attr_accessor :number
end
