class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def listing
    @user = current_user
  end

  def like
    @user = current_user
  end

  def thinking
    @user = current_user
  end

  def purchase
    @user = current_user
  end

  def notification
    @user = current_user
  end

  def abandonment
    @user = current_user
  end
end
