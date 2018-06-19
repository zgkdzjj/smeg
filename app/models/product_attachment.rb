class ProductAttachment < ApplicationRecord

  belongs_to :product
  belongs_to :attachment

end
