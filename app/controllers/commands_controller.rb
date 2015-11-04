class CommandsController < ApplicationController
  attr_accessor :player

  def index
    render text: player.commands.map { |command| command.to_hash }.to_json
  end

  def execute
  end
end
