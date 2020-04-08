class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  # tinh@gmail.com -> self.email.slipn('@') -> ['tinh', 'gmail.com']
  # ==> [0] => "tinh".capitalize => Tinh
  def username 
    return email.split('@')[0].capitalize
  end

  def comment_created
    self.number_of_comments = number_of_comments + 1
    save 
    number_of_comments
  end
end
