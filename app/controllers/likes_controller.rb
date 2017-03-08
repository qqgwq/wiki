class LikesController < ApplicationController
  before_action :find_likeable, :require_login
  def create
    @likeable.likes.find_or_create_by user: current_user
  end

  def destroy
    @likeable.likes.where(user: current_user).delete_all
  end


  private

  def find_likeable
    resource, id = request.path.split('/')[1, 2] #article/id
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
