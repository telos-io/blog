class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :post_params, only: [:create, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to post_path(@post), notice: "Post created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post Destroyed"
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
