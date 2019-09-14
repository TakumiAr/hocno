class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def listing
    @user = current_user
  end

  def like
  end

  def thinking
  end

  def purchase
  end

  def notification
  end

  def abandonment
  end
end
