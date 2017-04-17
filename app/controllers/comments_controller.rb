class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :destroy, :edit, :update]
  before_action :require_login, only: [:create, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create params.require(:comment).permit(:content).merge(user: current_user)
    respond_to do |format|
    if @comment.save
      flash[:success] = "成功添加评论"
      format.html {redirect_to article_path(@article)}
      format.js
    else
      format.html {render 'new'}
      format.js
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update params.require(:comment).permit(:content)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end



  private

  def find_comment
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end
end
