class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
  end

  def about
  end
end
