class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :menu

  enum payment_method: {cash: 0}
  # enum payment_method: {credit: 0, cash: 1, bank: 2}

end
