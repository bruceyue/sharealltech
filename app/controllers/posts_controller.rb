class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  caches_page :show
  # GET /posts
  # GET /posts.json
  def index
    seach_months_post
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    elsif params[:search]
      @posts = Post.search_published(params[:search]).paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
    fresh_when(:etag => [@posts, @post_month], :public => true)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    seach_months_post
    @post = Post.find(params[:id])
    @comment_count = @post.comments.count
    #fresh_when(:etag => [@posts, @post_month], :public => true)
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user  = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        if current_user != nil && current_user.sf_user_id != nil
          Databasedotcom::Chatter::UserProfileFeed.post(@client, current_user.sf_user_id, :text => @post.title, :url => (request.url+'/'+@post.id.to_s))
        end
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
