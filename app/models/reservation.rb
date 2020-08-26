class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :menu

  enum payment_method: {'クレジットカード支払い': 0, '当日現金支払い': 1, '銀行振り込み': 2}

end
