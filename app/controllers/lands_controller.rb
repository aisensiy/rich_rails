class LandsController < ApplicationController
  attr_accessor :game

  def index
    render text: @game.lands.to_json
  end
end
