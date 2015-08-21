class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new#(comment_params)
    comment_params = params.require(:comment).permit(:body)
    @post = Post.find params[:post_id]
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), alert: "Comment Created"
    else
      render :new
    end
  end

  def destroy
  end

end
