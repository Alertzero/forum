class PostsController < ApplicationController

 
  def index
    @posts = Post.all
  end

  def show
    set_post
    @comment = Comment.new
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_values)
    @post.account_id = current_or_guest_account.id
    @post.community_id = params[:community_id]
    if @post.save
      redirect_to community_path(@post.community_id)
    else
      @community = Community.find(params[:community_id])
      render new
    end
  end


  private

def set_post
  @post = Post.includes(:comments).find(params[:id])
end
  
  def post_values
    params.require(:post).permit(:title,:body)
  end
end
