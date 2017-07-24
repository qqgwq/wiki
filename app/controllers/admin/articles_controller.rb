class Admin::ArticlesController < Admin::ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def complete
    @article = Article.find(params[:id])
    @article.complete! if @article.audit?
    flash[:success] = "审核通过"
    redirect_to admin_article_path
  end

  def deny
    @article = Article.find(params[:id])
    @article.deny! if @article.audit?
    flash[:danger] = "已拒绝"
    redirect_to admin_article_path
  end
end