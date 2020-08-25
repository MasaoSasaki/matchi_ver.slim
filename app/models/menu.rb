class Menu < ApplicationRecord

  belongs_to :restaurant
  has_many :reservation

  enum reservation_method: {'ご予約のみ': 0, 'ご予約可能': 1, 'ご予約不可': 2}

  attachment :menu_image
end
