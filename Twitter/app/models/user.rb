class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :user

def password_required?
(authentications.empty? || !password.blank?) && super
end

def update_with_password(params, *options)
 if encrypted_password.blank?
 update_attributes(params, *options)
 else
 super
 end
end	
end