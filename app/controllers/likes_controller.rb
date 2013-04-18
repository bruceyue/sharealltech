class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if !current_user
      flash[:notice] = 'Please login first!'
    else
      if current_user.has_like? @post
        flash[:notice] = 'You have liked it!'
      else
        @like = @post.likes.build(params[:like])
        @like.post = @post
        @like.user = current_user
        @like.save
      end
    end
    render :toggle
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @post = @like.post
    render :toggle
  end
end