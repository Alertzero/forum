class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except: %i[index show]

  def index
    @communities = Community.all
  end

  def show
    set_community
    @posts = @community.posts
    @subscribers_count = if @community.subscribers.present?
                           @community.subscribers.count
                         else
                           0
                         end
    @is_subscribed = if account_signed_in?
                       Subscription.where(community_id: @community.id,
                                          account_id: current_account.id).any?
                     else
                       false
                     end
    @subscription = Subscription.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_values)
    @community.account_id = current_account.id
    if @community.save
      redirect_to communities_path
    else
      render new
    end
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_values
    params.require(:community).permit(:name, :url, :rules)
  end
end
