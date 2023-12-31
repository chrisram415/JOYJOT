# Controller responsible for managing Reccomendations in the application.
# <%# adding line of comment code to fix revert %>



class RecommendationsController < ApplicationController

  def index
    # @recommendations = current_user.recommendations

    if params[:query].present?
      @recommendations = Recommendation.search_by_activity(params[:query])
    else
      # @recommendations = Recommendation.all
      # add .order(created_at: :desc) to display from most recent 1st = decending order based on created_at timetsamps
      @recommendations = current_user.recommendations.order(created_at: :desc)
    end
  end

  def show
    # raise
    @recommendation = set_recommendations
    @user = current_user
    # For the rating form
    @rating = @recommendation.rating
    startdate = Date.today.prev_occurring(:friday)
    # enddate = startdate + 6.days
    enddate = startdate + 7.days
    @joys = @user.joys.where(created_at: startdate...enddate)
    joy_ratings = @joys.map do |joy|
      # || operator to convert any nil ratings to 0 when building the joy_ratings array.
      joy.rating || 0  # Convert nil ratings to 0
    end
    # if joy_ratings.empty?
    #   @ave_rating = 0
    # else
    @ave_rating = (joy_ratings.sum.to_f / joy_ratings.count).round(1)
    # end
  end

  def update
    @recommendation = set_recommendations

    if @recommendation.update(recommendation_params)
      redirect_to @recommendation, notice: 'Rating was successfully updated.'
    else
      render :show
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

# <%# adding line of comment code to fix revert %>


#  # code below creates a reccomendation from the joys within a period from current_user
#  @user = current_user
#  startdate = Date.today.prev_occurring(:friday)
#  # enddate = startdate + 6.days
#  enddate = startdate + 2.days
#  @joys = @user.joys.where(created_at: startdate...enddate)

#  descriptions = @joys.map { |joy| joy.description }

#  @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. I will provide you with an array of strings about my joys from this week, and it will be your job to come up with strategies that can help me achieve further happiness, max 100 words. Only do one of the following: If the request contains strings, suggest 2 activities I can do this weekend to continue feeling joy. Otherwise, provide 3 ideas on how to find joy.

#    The following request is an array of strings detailing things that brought me joy this week: #{descriptions}").call
#  @my_reccomendation = Recommendation.new
#  @my_reccomendation.user = current_user
#  @my_reccomendation.activity = @response # Assign the OpenAI response to the 'fortune' attribute
#  @my_reccomendation.save
