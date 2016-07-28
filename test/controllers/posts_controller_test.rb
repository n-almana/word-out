require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	include(Devise::Test::ControllerHelpers)

  def setup 
  	@user = noora
  	sign_in(@user)
  end 

  test 'should show the new post form' do 
  	get(:new)
  	assert_response(:success)
  end 

  test 'should create new post' do
  	assert_difference('Post.count') do 
  		post(:create, post: {text: 'This is a new post', user_id: @user.id})
  	end 

  	post = Post.last 
  	assert_equal('This is a new post', post.text)
  	assert_equal(@user, post.user)
  	assert_equal('Created your new post', flash[:info])
  	assert_redirected_to(post_url(post))
  end 

end

