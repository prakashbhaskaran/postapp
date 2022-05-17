class PostsController < ApplicationController
  before_action :set_post
  def show

  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
       format.html{ redirect_to root_path }
      else
        format.turbo_stream{ render turbo_stream: turbo_stream.replace(:post_form, partial: "posts/form", locals: { post: @post }) }
      end
    end  
  end

  def destroy
    current_user.posts.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Successfully deleted!' }
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:content)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end
