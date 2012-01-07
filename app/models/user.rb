class User < ActiveRecord::Base
  
  ROLES = %w[admin moderator author banned]

  has_and_belongs_to_many :roles
  has_many :articles

  # Include default devise modules. Others available are:
  devise :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable , :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :roles

  #def roles=(roles)
  #  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  #end

  #def roles
  #  ROLES.reject do |r|
  #    ((roles_mask || 0) & 2**ROLES.index(r)).zero?
  #  end
  #end

  def has_role?(role_sym)
    puts " -----------> roles: #{role_sym}"
    roles.any? { |r| 
      puts r.name.underscore.to_sym == role_sym
      puts "------ #{r.name}"
      r.name.underscore.to_sym == role_sym 
    }
  end

end
