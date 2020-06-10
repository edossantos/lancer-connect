class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    #main page - show All new PostsController
    @posts = Post.all

  end

  def profile
    #User profile
  end

  def set_account
    @account = Account.find_by_username(params[:username])
  end

end
