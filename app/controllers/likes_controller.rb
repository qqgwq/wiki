class LikesController < ApplicationController
  before_action :find_likeable, :require_login
  def create
    #binding.pry     
    @likeable.likes.find_or_create_by user: current_user
    redirect_to :back
  end

  def destroy
    @likeable.likes.where(user: current_user).delete_all
    redirect_to :back
  end


  private

  def find_likeable
    resource, id = request.path.split('/')[1, 2] #article/id
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
