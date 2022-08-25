require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  let(:result) { JSON.parse(response.body) }

  describe '#index' do
    context 'when fetching all tweets' do
      before do
        11.times do
          create(:tweet)
        end
      end

      it 'returns 10 results' do
        get tweets_path
        expect(result.size).to eq(10)
      end

      it 'returns correctly the paginate page' do
        get tweets_path, params: { page: 2 }
        expect(result.size).to eq(1)
      end

      it 'returns ir correct order' do
        get tweets_path
        expect(result.first['id']).to eq(Tweet.order(created_at: :desc).first.id)
      end
    end
  end
end
