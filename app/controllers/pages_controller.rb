# Controller responsible for managing pages in the application.
# <%# adding line of comment code to fix revert %>

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @joy = Joy.new
  end
end
