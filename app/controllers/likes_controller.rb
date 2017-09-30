class LikesController < ApplicationController
  before_action :find_likeable, :require_login

  def create
    @like = @likeable.likes.find_or_create_by user: current_user
    #创建点赞通知
    if current_user != @likeable.user
        Notification.create!(
                    user: @likeable.user,
                    subject_id: @like.id,
                    subject_type: 'Like',
                    read: false)
    else
      current_user == @likeable.user #用户自己点赞,不创建通知
      return
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @likeable.likes.where(user: current_user).delete_all
    respond_to do |format|
      format.js
    end
  end


  private

  def find_likeable
    resource, id = request.path.split('/')[1, 2] #article/id
    @likeable = resource.singularize.classify.constantize.find(id) #查询article id
  end
end
