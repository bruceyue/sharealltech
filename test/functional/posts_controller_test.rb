require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { body: @post.body, category: @post.category, dislikes: @post.dislikes, is_deleted: @post.is_deleted, is_published: @post.is_published, likes: @post.likes, title: @post.title, total_comments: @post.total_comments, views: @post.views }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, id: @post, post: { body: @post.body, category: @post.category, dislikes: @post.dislikes, is_deleted: @post.is_deleted, is_published: @post.is_published, likes: @post.likes, title: @post.title, total_comments: @post.total_comments, views: @post.views }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
