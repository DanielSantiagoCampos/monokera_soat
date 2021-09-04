class Order < ApplicationRecord

  belongs_to :vehicle
  belongs_to :user
  belongs_to :tariff
  belongs_to :credit_card, optional: true

  scope :active, -> { where(status: 1) }

end
