class ArticlesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  before_action :set_search
  def index
    #binding.pry
    if params[:category].blank?
       @q = Article.ransack(params[:q])
       @articles = @q.result.includes(:user, :comments).order(created_at: :desc).page(params[:page]).per(2)
    else
      @category_name = params[:category]
      @category_id = Category.find_by(name: params[:category]).id
      @articles = Article.where(category_id: @category_id).order(created_at: :desc).page(params[:page]).per(2)
      respond_to do |format|
        format.js
      end
    end   
  end

  def new
    @article = current_user.articles.build
  end

  def show
    unless cookies["view-article-#{@article.id}"]
      cookies["view-article-#{@article.id}"] = "true"
      @article.view!
    end
  end

  def create
    #binding.pry
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
      flash[:success] = "创建成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_url
      @article.update(created_at: Time.zone.now)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to @article
  end

  




  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :avatar)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
