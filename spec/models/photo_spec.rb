require 'rails_helper'

RSpec.describe Photo, type: :model do


  describe '#status' do

    context 'when the status is 0' do
      let(:photo) { Photo.new() }

      it 'is in_progress' do
        expect(photo.in_progress?).to be_truthy
      end
    end

    context 'when the status is 1' do
      let(:photo) { Photo.new(status: 1) }

      it 'is rejected' do
        expect(photo.rejected?).to be_truthy
      end
    end

    context 'when the status is 2' do
      let(:photo) { Photo.new(status: 2) }

      it 'is accepted' do
        expect(photo.accepted?).to be_truthy
      end
    end
  end

end
