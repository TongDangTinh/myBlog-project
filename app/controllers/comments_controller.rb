class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :find_commentable, only: :create
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.build comment_params
    @comment.user = current_user
    if params[:comment_id]
      @comment.reply = true
    end
    @comment.save
  end

  def edit; end

  def update
    if @comment.edit_history == ''
      # if \n => replace \n  with <br/> <hr/>
      @comemnt.edit_history = "Original: " + 
        @comemnt.body.body.to_plain_text + "\n"
    else
      @comment.edit_history = @comemnt.edit_history + "Edit: "+ 
        params[:comment][:body] + "\n"
    end

    @comment.update comment_params
  end

  def destroy
    @comment.destroy
  end

  def history
    
  end

  private
    def comment_params
      params.require(:comment).permit :body
    end

    def find_commentable
      # Comment
      if params[:comment_id]
        @commentable = Comment.find_by_id params[:comment_id]
      elsif
      # Post
        @commentable = Post.friendly.find params[:post_id]
      end
    end

    def set_comment
      @comment = Comment.find params[:id]
    end
end
