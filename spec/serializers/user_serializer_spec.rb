require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do

  let(:photo) { build :photo, id: 1 }
  let(:user) { User.new(id: 1, email: 'jt@dream.com', photos: [photo]) }
  let(:subject) { Hashie::Mash.new(UserSerializer.new(user).serializable_hash) }

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
    expect(subject.id).to eq user.id
  end

  it 'has an email' do
    expect(subject.email).to eq user.email
  end

  it 'has a distance' do
    expect(subject.distance).to eq user.distance
  end

  it 'has one photo' do
    expect(subject.photos.count).to eq 1
  end
end
