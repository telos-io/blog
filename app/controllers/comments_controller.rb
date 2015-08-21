class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @post = Post.find params[:post_id]
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), alert: "Comment Created"
    else
      redirect_to post_path(@post), alert: "Try again"
    end
  end

  def destroy
    comment = Comment.find params[:id]
    @post = comment.post
    comment.destroy
    redirect_to post_path(@post), alert: "Comment deleted"
  end

end
