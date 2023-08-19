class GamecardJob < ApplicationJob
  queue_as :default

  def perform(joy)
    game =
      if Game.where(user_id: joy.user_id).last.gamecards.count == 5
        # send notification that new game is available?
        Game.new(user_id: joy.user_id)
      else
        Game.where(user_id: joy.user_id).last
      end
    card = Gamecard.new(joy_id: joy.id, game_id: game.id)
    image_url = StableDiffusionService.new(joy.description).call
    card.image_url = image_url
    card.save
  end
end
