class Account < ActiveRecord::Base 
  belongs_to :company
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :company_id, :encrypted_password, :reset_password_token, :reset_password_sent_at
  attr_accessible :remember_created_at, :current_sign_in_at
  attr_accessible :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  # attr_accessible :title, :body
end
