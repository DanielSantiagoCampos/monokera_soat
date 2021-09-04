require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  describe "Associations" do
    it { should belong_to(:tariff) }
    it { should has_many(:order) }
  end

  describe "scope" do

    describe 'has_able_soat?' do

      let(:tariff_type)  { create(:tariff_type, description: "Clase 9 (Carros de servicio intermunicipal)") }
      let(:tariff)       { create(:tariff, code: 92, cylinders_description: "10 o más pasajeros", younger_than_twelve: nil, prime_tax: 930300, contribution_tax: 465150, total_value: 1397250, tariff_type_id: tariff_type.id) }
      let(:user)         { create(:user, document: '1233908635', document_type: 'Cedula de ciudadania', full_name: 'Daniel Santiago Campos', email: 'camposdaniel1002@gmail.com', phone: '3058193476') }
      let(:vehicle)      { create(:vehicle, placa: "JJM460", date: "2019-01-07 00:00:00.000000000 +0000", tariff_id: 7) }

      context 'when vehicle has active SOAT' do
        let(:order) { create(:active_order, status: 1, start_at: Time.zone.now-1.year, finish_at: Time.zone.now, payment_value: 1397250, user_id: user.id, vehicle_id: vehicle.id, tariff_id: tariff_id) }

        it 'should return true' do
          expect(vehicle.has_able_soat?).to be_truthy
        end
      end

      context 'when vehicle has not active SOAT' do
        let(:order) { create(:active_order, status: 1, start_at: Time.zone.now-2.year, finish_at: Time.zone.now-1.year, payment_value: 1397250, user_id: user.id, vehicle_id: vehicle.id, tariff_id: tariff_id) }

        it 'should return false' do
          expect(vehicle.has_able_soat?).to be_falsey
        end
      end

    end
  end
end
