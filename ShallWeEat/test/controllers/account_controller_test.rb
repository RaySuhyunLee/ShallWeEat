require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

   #test '#signup_success' do
   # post :signup, {'name' => 'UserExampleNew', 'pass' => 'PassExampleNew'}
   # account = Account.new
   #end

   #test "#create_success" do
    # post :create, params: { account: {'name' => 'UserTest', 'pass' => 'PassTest'}}
    # json = JSON.parse(response.body)
    # assert json['st'] == 0
   #end

     #test '#create_failure' do
     #post :create, {'name' => 'UserTest', 'pass' => 'UserExampleNew'}
     #json = JSON.parse(response.body)
      #assert json['signup']
   #end

  #test '#create_failure_user' do
    # post :create, {'name' => 'test', 'pass' => 'testPass'}
    # json = JSON.parse(response.body)
    # assert json['error_code'] == -1
   #end


  #test '#create_failure_pass' do
    # post :create, {'name' => 'UserTest', 'pass' => 'pass'}
    # json = JSON.parse(response.body)
    # assert json['error_code'] == -2
   #end


  test "#edit_without_login" do
    get :edit
    assert_redirected_to accounts_index_path
  end

  test "#edit_profile_without_login" do
    post :edit_profile, {}, format: :json
    json = JSON.parse(response.body)
     assert json['st'] == -1
  end

  test "#edit_profile_with_login" do
    post :edit_profile, {'name' => 'UserExample90', 'pass' => 'PassExample90'}, format: :json
    json = JSON.parse(response.body)
     assert json['st'] == 0
  end

  #test "#edit_notnilname" do
   # post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
    #get :edit
   # json = JSON.parse(response.body)
    #assert json['name'] == 'UserExample90'
  #end


#  test "#edit_profile" do
 #   post :edit_profile, {'name' => nil}
  #  assert_redirected_to accounts_index_path
  #end




   test "#login_success" do #works!
     post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
     json = JSON.parse(response.body)
     assert json['user_name'] == 'UserExample90'
   end

   test "#login_failure" do  #works!
     post :login, {'name' => 'UserFailure', 'pass' => 'PassFailure'}
     json = JSON.parse(response.body)
     assert json['error_code'] == -4
   end

   test "#logout" do  #works!
     get :logout
     assert_redirected_to accounts_index_path
   end



end
