class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # tinh@gmail.com -> self.email.slipn('@') -> ['tinh', 'gmail.com']
  # ==> [0] => "tinh".capitalize => Tinh
  def username 
    return email.split('@')[0].capitalize
  end
end
