require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should create user' do
    user = User.new
    assert user
  end

  test 'should create user with login and password' do
    user = User.new(login: 'username', password: 'password')
    assert user.valid?
    assert user.save
  end

  test 'should not validate user with empty login or password' do
    user = User.new(login: '', password: 'password')
    assert !user.valid?

    user = User.new(login: 'login', password: '')
    assert !user.valid?
  end

  test 'should not authenticate user with incorrect password' do
    user = User.new(login: 'username', password: 'correct')
    assert !User.find_by_login('username').try(:authenticate, 'incorrect')
  end

end
