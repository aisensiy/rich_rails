require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "get player info" do
    it "should success and return player info" do
      land1 = Land.new
      land1.id = 1

      player = Player.new
      player.id = 1
      player.money = 1000
      player.point = 0
      player.lands = [land1]
      player.currentPosition = land1
      controller.player = player

      get :show, id: 1
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(1)
      expect(json['money']).to eq(1000)
      expect(json['point']).to eq(0)
      expect(json['lands'][0]['id']).to eq(1)
      expect(json['currentPosition']['id']).to eq(1)
    end

    it "should get 404 if play not exists" do
      get :show, id: 1, format: :json
      expect(response).to have_http_status(404)
    end
  end

end
