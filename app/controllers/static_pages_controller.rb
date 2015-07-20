class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.order('created_at DESC')
    end
  end
end
