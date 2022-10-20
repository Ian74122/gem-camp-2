class CommentsController < ApplicationController
  before_action :set_post
  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end


  def create
    @comment = @post.comments.build(params_comment)
    if @comment.save
      redirect_to post_comments_path(@post)
    else
      render :new
    end
  end
  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def params_comment
    params.require(:comment).permit(:content)
  end
end
