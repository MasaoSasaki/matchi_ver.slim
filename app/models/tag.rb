class Tag < ApplicationRecord

  has_many :menu_tag, dependent: :destroy

end
