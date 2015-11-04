class CommandsController < ApplicationController
  attr_accessor :game

  def index
    player = game.get_player(params[:player_id].to_i)
    if player.nil?
      head :not_found
      return
    end
    render text: player.commands.map { |command| command.to_hash }.to_json
  end

  def executed
    player = game.get_player(params[:player_id].to_i)
    if player.nil?
      head :not_found
      return
    end
    command = player.get_command_by_name params[:id]
    if command.nil?
      head :not_found
      return
    end
    resp = player.execute(command)
    if resp.class.name == "Response"
      render text: {message: resp.message}.to_json
    else
      render text: {message: resp.message}.to_json, status: 302
    end
  end
end
