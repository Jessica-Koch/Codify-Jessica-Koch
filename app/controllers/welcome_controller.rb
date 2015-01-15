class WelcomeController < ApplicationController
  def index
    @array = (1..10).map do |num|
      num
    end
  end


end
