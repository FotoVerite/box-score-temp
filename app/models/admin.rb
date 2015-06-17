class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable

  attr_accessible :email, :first_name, :last_name, :password,
    :password_confirmation, :remember_me, :school_id

  belongs_to :school

  def name
    if first_name && last_name
      "#{first_name} #{last_name}"
    end
  end

  def superadmin?
    email == 'patrick@hsboxscoresnyc.com' || email.include?('wizarddevelopment.com')
  end
end
