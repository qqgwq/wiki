class Admin::ArticlesController < Admin::ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(3)
  end

  def show
    @article = Article.find(params[:id])
  end

  def complete
    @article = Article.find(params[:id])
    if @article.audit? || @article.deny?
      @article.complete! 
      flash[:success] = "审核通过"
      redirect_to admin_articles_path
    end
  end

  def deny
    @article = Article.find(params[:id])
    if @article.audit? || @article.complete?
      @article.deny! 
      flash[:danger] = "已拒绝"
      redirect_to admin_articles_path
    end
  end
end