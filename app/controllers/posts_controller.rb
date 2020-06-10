class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id if account_signed_in?
    unless @post.save
      redirect_to new_post_path, flash: {success: "Something went wrong try again!"}

    else
      redirect_to dashboard_path, flash: {success: "Posted created!"}
    end

  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
