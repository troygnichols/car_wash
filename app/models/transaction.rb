class Transaction < ApplicationRecord

  belongs_to :vehicle

  validates :price, presence: true
end
