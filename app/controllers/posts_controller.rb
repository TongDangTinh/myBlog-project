class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save 
      flash[:success]  = "Post was successfully created."
      redirect_to posts_path
    else
      render :new 
    end
  end

  private

    def post_params
      params.require(:post).permit :title, :thumnail, :banner, :body
    end
end
