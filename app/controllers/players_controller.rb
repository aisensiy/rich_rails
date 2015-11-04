class PlayersController < ApplicationController
  def show
    @player = game.get_player(params[:id].to_i)
    if @player.nil?
      head :not_found
    else
      render text: {
        id: @player.id,
        money: @player.money,
        point: @player.point,
        lands: @player.lands.map {|land| land.to_hash},
        currentPosition: @player.currentPosition.to_hash
      }.to_json
    end

  end
end
