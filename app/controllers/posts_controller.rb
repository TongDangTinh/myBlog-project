class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :is_admin!, except: [:index, :show]
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page])
  end
  
  def show
    views = @post.views + 1
    @post.update(views: views)
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save 
      flash[:success]  = "Post was successfully created."
      redirect_to posts_path
    else
      render :new 
    end
  end

  private

    def find_post
      @post = Post.friendly.find params[:id]
    end

    def post_params
      params.require(:post).permit :title, :thumnail, :banner, :body
    end
end
