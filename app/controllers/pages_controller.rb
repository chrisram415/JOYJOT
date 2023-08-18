# Controller responsible for managing pages in the application.
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @joy = Joy.new

    # # # call another method:
    # run_weekly_task if Time.now.friday? && Time.now.hour >= 0

    # 2nd version of calling the mthod below but only triggers once every friday anytime user arrives to home
    # and will not run code again if ran already
    if Time.now.friday? && Time.now.hour >= 0
      unless session[:weekly_task_executed]
        run_weekly_task
        session[:weekly_task_executed] = true
      end
    else
      session[:weekly_task_executed] = false
    end
  end


  private

  def run_weekly_task
    # Your weekly task logic here
    # code below creates a reccomendation from the joys within a period from current_user
    @user = current_user
    startdate = Date.today.prev_occurring(:friday)
    # enddate = startdate + 6.days
    enddate = startdate + 7.days
    @joys = @user.joys.where(created_at: startdate...enddate)
    # @joys = @user.joys

    descriptions = @joys.map { |joy| joy.description }

    @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. I will provide you with an array of strings about my joys from this week, and it will be your job to come up with strategies that can help me achieve further happiness, max 100 words. Only do one of the following: If the request contains strings, suggest 2 activities I can do this weekend to continue feeling joy. Otherwise, provide 3 ideas on how to find joy.

      The following request is an array of strings detailing things that brought me joy this week: #{descriptions}").call

    # @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. count how many strings I have in this array and tell me the number and a joke: #{descriptions}").call
    @my_reccomendation = Recommendation.new
    @my_reccomendation.user = current_user
    @my_reccomendation.activity = @response # Assign the OpenAI response to the 'fortune' attribute
    # @my_reccomendation.activity = descriptions
    @my_reccomendation.save
  end

end

  # @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. I will provide you with an array of strings about my joys from this week, and it will be your job to come up with strategies that can help me achieve further happiness, max 100 words. Only do one of the following: If the request contains strings, suggest 2 activities I can do this weekend to continue feeling joy. Otherwise, provide 3 ideas on how to find joy.

  #   The following request is an array of strings detailing things that brought me joy this week: #{descriptions}").call

  #   # # testing code
    # # Your weekly task logic here
    # # code below creates a reccomendation from the joys within a period from current_user
    # @user = current_user
    # # startdate = Date.today.prev_occurring(:friday)
    # # # enddate = startdate + 6.days
    # # enddate = startdate + 6.days
    # # @joys = @user.joys.where(created_at: startdate...enddate)
    # @joys = @user.joys

    # descriptions = @joys.map { |joy| joy.description }


    # # @response = OpenaiService.new("You are JoyJot, a cheerful motivational chatbot friend. count how many strings I have in this array and tell me the number and a joke: #{descriptions}").call
    # @my_reccomendation = Recommendation.new
    # @my_reccomendation.user = current_user
    # # @my_reccomendation.activity = @response # Assign the OpenAI response to the 'fortune' attribute
    # @my_reccomendation.activity = descriptions
    # @my_reccomendation.save
