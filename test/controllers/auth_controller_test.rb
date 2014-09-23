class AuthControllerTest < ActionController::TestCase

  test 'should get login form' do
    get :login
    assert_response :success
  end

  test 'should get register form' do
    get :register
    assert_response :success
  end

  test 'sign out should redirect home' do
    get :sign_out
    assert_redirected_to root_path
  end

  test 'sign in should redirect home' do
    post :sign_in
    assert_redirected_to root_path
  end

  test 'sign up should redirect home' do
    post :sign_up
    assert_redirected_to root_path
  end

end
