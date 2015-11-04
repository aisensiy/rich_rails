class CommandsController < ApplicationController
  attr_accessor :player

  def index
    if player.nil?
      head :not_found
      return
    end
    render text: player.commands.map { |command| command.to_hash }.to_json
  end

  def execute
  end
end
