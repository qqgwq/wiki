class Admin::CommentsController < Admin::ApplicationController
  def index
    @comments = Comment.includes(:user, :article).order("id desc").page(params[:page]).per(3)
  end
end