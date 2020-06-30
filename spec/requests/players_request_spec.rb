require 'rails_helper'
RSpec.describe "Players", type: :request do
  describe 'indexページ' do
    context "indexページが正しく表示される" do
      before do
        get players_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("一覧")
      end
    end
  end
end
