class VotesController < ApplicationController
  before_action :authenticate_account!
 
  def create
    
    vote = Vote.new
    post_id = params[:post_id]
    vote.post_id = params[:post_id]
    vote.upvote = params[:upvote]
    vote.account_id = current_or_guest_account.id
    existing_vote = Vote.where(account_id: current_or_guest_account.id, post_id: post_id)
    respond_to do |format|
      format.js do
        if existing_vote.size > 0
          existing_vote.first.destroy
        else
           vote.save
        end
        @post = Post.find(post_id)
        render 'votes/create'
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:upvote, :post_id)
  end
end
