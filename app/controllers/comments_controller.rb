class CommentsController < ApplicationController
  before_filter :require_user
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save
    #Databasedotcom::Chatter::UserProfileFeed.post(@client, current_user.sf_user_id, :text => @comment.body, :url => request.referer)
    fresh_when(:etag => [@post, @comment], :public => true)
    respond_to do |format|
      format.html { redirect_to post_path(@post)}
      format.js { render :nothing => true }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post)}
      format.js { render :nothing => true }
    end
  end
end
