class Menu < ApplicationRecord

  belongs_to :restaurant
  has_many :reservation

  enum reservation_status: [:予約のみ, :予約可, :予約不可]

  # attachment :menu_image
end
