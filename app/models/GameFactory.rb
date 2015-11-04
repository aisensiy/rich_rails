class GameFactory < ActiveRecord::Base
  def self.game=(game)
    @@game = game
  end

  def self.getGame
    @@game
  end
end
