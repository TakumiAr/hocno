class LikesController < ApplicationController

  def create
    like = current_user.likes.create(post_id: params[:post_id])
    redirect_to post_path(like.post)
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to post_path(like.post)
  end
end