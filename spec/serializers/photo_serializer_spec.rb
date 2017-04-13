require 'rails_helper'

RSpec.describe PhotoSerializer, type: :serializer do

  let(:photo) { build :photo, id: 1 }
  let(:subject) { Hashie::Mash.new(PhotoSerializer.new(photo).serializable_hash) }

  it 'has an id' do
    expect(subject.id).to eq photo.id
  end

  it 'has an order' do
    expect(subject.order).to eq photo.order
  end

  it 'has a status' do
    expect(subject.status).to eq photo.status
  end

  it 'has an url' do
    expect(subject.url).to eq photo.image.url
  end

end