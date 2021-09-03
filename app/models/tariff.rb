class Tariff < ApplicationRecord
  belongs_to :tariff_type, required: true
end
