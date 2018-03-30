class ArticlesController < ApplicationController
  before_action :require_login, except: [:index, :show, :release]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  before_action :set_search

  def index
    if params[:category].blank?
      @q = Article.ransack(params[:q])
      @articles = @q.result.includes(:user, :comments).order(created_at: :desc).page(params[:page]).per(3)
      @users = User.order_by_ids(User.ranks.members.reverse) #用户积分排序
    else
      @category_name = params[:category]
      @category_id = Category.where(name: params[:category]).first&.id
      @articles = Article.where(category_id: @category_id).order(created_at: :desc).page(params[:page]).per(3)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @article = Article.new
  end

  def show
    unless cookies["view-article-#{@article.id}"]
      cookies["view-article-#{@article.id}"] = "true"
      @article.view!
    end
    if current_user
      unless @article.limit_read.member?("#{current_user.id}")   # 判断当前用户是否在该集合中
        current_user.ranks.incr("#{current_user.id}", 3)     # 当前用户的积分数
        @article.limit_read << current_user.id  # 把当前用户写入集合中
      end
      @article.click_count.incr() # 添加用户的阅读量
    end
  end

  def create
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

  def release
    @releases = Article.all
    @user = User.friendly.find(params[:user_id])
  end


  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :avatar)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
