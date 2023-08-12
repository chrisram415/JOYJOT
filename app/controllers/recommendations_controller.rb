# Controller responsible for managing Reccomendations in the application.
class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end
  
  def show
    @recommendation = set_recommendations
    @user = current_user
    startdate = Date.today.prev_occurring(:friday)
    enddate = startdate + 6.days
    @joys = @user.joys.where(created_at: startdate...enddate)
  end

  private

  def set_recommendations
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:activity, :rating, :genre)
  end
end
