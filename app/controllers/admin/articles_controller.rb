class Admin::ArticlesController < Admin::ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
  end
end