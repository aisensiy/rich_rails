require 'rails_helper'

RSpec.describe CommandsController, type: :controller do

  describe "list player's commands" do
    it "returns command list" do
      player = Player.new
      player.stub(:commands) do
        command1 = Command.new
        command1.stub(:name).and_return "roll"
        command1.stub(:parameters).and_return []
        [command1]
      end

      game = Game.new
      game.stub(:get_player).with(1).and_return player
      controller.game = game

      get :index, player_id: 1, format: :json
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json.size).to eq(1)
      expect(json[0]['name']).to eq("roll")
    end

    it "return 404 is player not found" do
      game = Game.new
      game.stub(:get_player).with(1).and_return nil
      controller.game = game

      get :index, player_id: 1, format: :json
      expect(response).to have_http_status(404)
    end
  end

end
