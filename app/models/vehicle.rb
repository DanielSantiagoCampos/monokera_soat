class Vehicle < ApplicationRecord

  has_many :orders
  belongs_to :tariff

  def has_able_soat?
    active_order = orders&.active&.first
    if active_order.present?
      active_order.finish_at > Time.zone.now
    end
  end

end
