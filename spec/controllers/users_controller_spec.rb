require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#index' do

    context 'when the user is not authenticated' do

      it 'return 401' do
        get :index
        expect(response.status).to eq 401
      end

    end

    context 'when the user is authenticated' do

      # 49th St. and 10th Avenue. New York, NY (USA)
      let!(:julian) { create :user, latitude: 40.764346, longitude: -73.9834023 }

      # Plaza de la Bandera. Santo Domingo, Dominican Republic
      let!(:yanko) { create :user, latitude: 18.4543659, longitude: -69.9847562 }

      # Blake's On The Park, 10th Street Northeast, Atlanta, GA
      let!(:will) { create :user, latitude: 33.7816459, longitude: -84.3820863 }


      context 'when julian makes a request' do

        before do
          login(julian)
        end

        it 'returns will' do
          get :index, params: { limit: 1 }
          actual = JSON.parse(response.body).map { |h| h['id'] }
          expect(actual).to eq [will.id]
        end

      end

      context 'when yanko makes a request' do

        before do
          login(yanko)
        end

        it 'returns will and julian' do
          get :index, params: { limit: 2, radius: 100000 }
          actual = JSON.parse(response.body).map { |h| h['id'] }
          expect(actual).to eq [will.id, julian.id]
        end

      end

    end

  end
end
