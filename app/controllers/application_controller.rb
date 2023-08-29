# Controller responsible for managing the application.

# app/controllers/application_controller.rb  def default_url_options   { host: ENV["DOMAIN"] || "localhost:3000" } end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_session

  private

  def initialize_session
    session[:weekly_task_executed] ||= false
    session[:button_triggered] ||= false
  end
end
