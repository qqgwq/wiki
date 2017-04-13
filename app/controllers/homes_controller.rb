class HomesController < ApplicationController
  def about
    @home = Home.first
  end
end
