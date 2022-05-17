class HomeController < ApplicationController
  before_action :ensure_current_user
  def index
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end
end
