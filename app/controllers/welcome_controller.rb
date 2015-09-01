class WelcomeController < ApplicationController

  def index
    @post = Post.last
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    end
  end

end
