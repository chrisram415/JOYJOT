class GamecardJob < ApplicationJob
  queue_as :default

  def perform(joy)
    game =
      if Game.where(user_id: joy.user_id).last.gamecards.count == 5
        # send notification that new game is available?
        Game.create(user_id: joy.user_id)
      else
        Game.where(user_id: joy.user_id).last
      end
    card = Gamecard.new(joy: joy, game: game)
    image_url = StablediffusionService.new(joy.description).call
    card.image_url = image_url
    card.save if card.image_url.present?
  end
end
