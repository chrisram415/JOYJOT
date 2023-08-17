class GamecardJob < ApplicationJob
  queue_as :default

  def perform(joy)
    game =
      if Game.last.gamecards.count == 5
        # send notification that new game is available?
        Game.new(user_id: joy.user_id)
      else
        Game.last
      end
    card = Gamecard.new(joy_id: joy.id, game_id: game.id)
    card.save
  end
end
