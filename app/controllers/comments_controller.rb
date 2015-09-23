class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @post = Post.find params[:post_id]
    @comment.post = @post
    respond_to do |format|
     if @comment.save
       PostsMailer.notify_post_owner(@comment).deliver_now
       format.html { redirect_to post_path(@post), notice: "comment created" }
       format.js   { render } # this renders: create.js.erb
     else
       format.html { render "/post/show" }
       format.js   { render js: "alert('failure');"}
     end
   end
  end

  def destroy
    comment = Comment.find params[:id]
    @post = comment.post
    comment.destroy
    redirect_to post_path(@post), alert: "Comment deleted"
  end

end
