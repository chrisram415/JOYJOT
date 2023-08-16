# Controller responsible for managing Reccomendations in the application.
class RecommendationsController < ApplicationController
  def index
    if params[:query].present?
      @recommendations = Recommendation.search_by_activity(params[:query])
    else
      @recommendations = Recommendation.all
    end
  end

  def show
    @recommendation = set_recommendations
    @user = current_user
    startdate = Date.today.prev_occurring(:friday)
    enddate = startdate + 6.days
    @joys = @user.joys.where(created_at: startdate...enddate)
    joy_ratings = @joys.map do |joy|
      joy.rating
    end
    if @joys.empty?
      @ave_rating = 0
    else
      @ave_rating = (joy_ratings.sum.to_f / @joys.count).round(1)
    end
  end

  private

  def set_recommendations
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:activity, :rating, :genre)
  end
end
