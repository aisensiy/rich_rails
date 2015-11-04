class PlayersController < ApplicationController
  attr_accessor :player

  def show
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
