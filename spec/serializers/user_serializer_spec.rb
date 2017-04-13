require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do


  describe '#serialized_user' do
    let(:user) { User.new(id: 1, email: 'jt@dream.com') }
    let(:serialized_user) { Hashie::Mash.new(UserSerializer.new(user).serializable_hash) }

    before do
      class User
        def distance
          500.00
        end
      end
    end

    after do
      class User
        remove_method :distance
      end
    end

    it 'has an id' do
      expect(serialized_user.id).to eq user.id
    end

    it 'has an email' do
      expect(serialized_user.email).to eq user.email
    end

    it 'has a distance' do
      expect(serialized_user.distance).to eq user.distance
    end
  end

end
