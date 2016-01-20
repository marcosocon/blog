class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_article
  before_action :authenticate_user!

  respond_to :html

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article
    @comment.save
    redirect_to @comment.article
  end

  def update
    @comment.update(comment_params)
    redirect_to @comment.article
  end

  def destroy
    @comment.destroy
    redirect_to @article
  end

  private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end
    
end
