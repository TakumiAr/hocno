class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @like = current_user.likes.find_by(post_id: @post.id)
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache, :status, :price, :budget, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_cont, :category_id_eq, :status_eq)
  end
end
