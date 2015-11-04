class CommandsController < ApplicationController
  def index
    player = game.get_player(params[:player_id].to_i)
    if player.nil?
      head :not_found
      return
    end
    render text: player.commands.map { |command| command.to_hash }.to_json
  end

  def execute
  end
end
