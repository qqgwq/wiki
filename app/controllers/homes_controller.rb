class HomesController < ApplicationController
  def new
    @home = Home.new
  end
  def about
    @home = Home.first
  end
end
