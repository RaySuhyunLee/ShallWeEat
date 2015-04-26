require 'test_helper'

class AccountsControllerTest < ActionController::TestCase


   #test '#signup_success' do
    # post :signup, {'name' => 'UserTest', 'pass' => 'PassExample'}
    # json = JSON.parse(response.body)
    # assert json['name'] == 'UserTest'
   #end

  #test '#signup_failure_user' do
    # post :signup, {'name' => 'test', 'pass' => 'testPass'}
    # json = JSON.parse(response.body)
    # assert json['error_code'] == -1
   #end


  #test '#signup_failure_pass' do
    # post :signup, {'name' => 'UserTest', 'pass' => 'pass'}
    # json = JSON.parse(response.body)
    # assert json['error_code'] == -2
   #end



   test '#login_success' do #doesnt work
     post :login, {'name' => 'UserExample', 'pass' => 'PassExample'}
     json = JSON.parse(response.body)
     assert json['user_name'] == 'UserExample'
   end

   test "#login_failure" do  #works
     post :login, {'name' => 'UserFailure', 'pass' => 'PassFailure'}
     json = JSON.parse(response.body)
     assert json['error_code'] == -4
   end

 #  test "#logout" do  #doesnt work
  #   post :logout
   #  assert_redirect_to root_path
   #end



end
