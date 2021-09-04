require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "Associations" do
    it { should belong_to(:vehicle) }
    it { should belong_to(:user) }
    it { should belong_to(:tariff) }
    it { should belong_to(:credit_card) }
  end

  describe "scope" do

    describe 'active' do

      let(:tariff_type)  { create(:tariff_type, description: "Clase 9 (Carros de servicio intermunicipal)") }
      let(:tariff)       { create(:tariff, code: 92, cylinders_description: "10 o más pasajeros", younger_than_twelve: nil, prime_tax: 930300, contribution_tax: 465150, total_value: 1397250, tariff_type_id: tariff_type.id) }
      let(:user)         { create(:user, document: '1233908635', document_type: 'Cedula de ciudadania', full_name: 'Daniel Santiago Campos', email: 'camposdaniel1002@gmail.com', phone: '3058193476') }
      let(:vehicle)      { create(:vehicle, placa: "JJM460", date: "2019-01-07 00:00:00.000000000 +0000", tariff_id: 7) }

      let(:active_order)   { create(:active_order, status: 1, start_at: Time.zone.now-1.year, finish_at: Time.zone.now, payment_value: 1397250, user_id: user.id, vehicle_id: vehicle.id, tariff_id: tariff_id) }
      let(:inactive_order) { create(:active_order, status: 0, start_at: Time.zone.now-1.year, finish_at: Time.zone.now, payment_value: 1397250, user_id: user.id, vehicle_id: vehicle.id, tariff_id: tariff_id) }

      context 'when has active SOATs' do
        it 'should return active record relation with just orders on state 1' do
          expect(described_class.active).to match_array([active_order])
        end
      end

    end
  end
end
