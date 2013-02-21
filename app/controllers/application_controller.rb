class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?

  API_VERSION = "26.0"

  def seach_months_post
    @posts = Post.order('created_at DESC').limit(200)
    @post_month = @posts.group_by { |p| p.created_at.beginning_of_month }
    fresh_when(:etag => @post_month, :public => true)
  end

  def admin?
    user = User.where(:email => 'bruce.yue@outlook.com').first
    return user != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    return true if current_user
  end

  # filter for pages that may only be visited by users logged in.
  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html { authenticate_user!}
        format.all { head(:unauthorized) }
      end
    else
      setup_api_client
    end
  end

  def redirect_to_target_or_default(default, *options)
    redirect_to(session[:return_to] || default, *options)
    session[:return_to] = nil
  end

  def store_target_location
    session[:return_to] = request.url
  end

  def setup_api_client
    @client = Databasedotcom::Client.new({})
    @client.version = API_VERSION
    @client.authenticate :token => current_user.access_token,
                         :refresh_token => current_user.refresh_token,
                         :instance_url => current_user.instance_url
  end
end
