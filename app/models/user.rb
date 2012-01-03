class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles

  # Include default devise modules. Others available are:
  devise :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable , :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
