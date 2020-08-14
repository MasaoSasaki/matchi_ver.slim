class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservation
  has_many :book_mark

  enum user_status: [:有効会員, :退会済み, :強制退会]

  def active_for_authentication?
    super && (self.user_status == 0)
  end

  attachment :profile_image
end
