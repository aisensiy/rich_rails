class GameController < ApplicationController
  attr_accessor :game

  def lands
    render text: @game.lands.to_json
  end
end
