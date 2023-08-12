# Controller responsible for managing Reccomendations in the application.
class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommandation.all
  end

  def show

  end

  private

  def set_recommendations
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:activity, :rating, :genre)
  end
end
