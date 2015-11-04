require 'rails_helper'

RSpec.describe LandsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      game = Game.new
      game.stub(:lands) do
        land1 = Land.new
        land1.id = 1
        land2 = Land.new
        land2.id = 2
        [land1, land2]
      end
      controller.game = game
      get :index
      expect(response).to have_http_status(:success)
      lands = JSON.parse(response.body)
      expect(lands.size).to eq(2)
      expect(lands[0]['id']).to eq(1)
    end
  end

end
