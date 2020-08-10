class Menu < ApplicationRecord

  belongs_to :restaurant
  has_many :reservation

  attachment :menu_image
end
