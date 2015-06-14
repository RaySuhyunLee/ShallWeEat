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
  	get :logout
    post :edit_profile
    json = JSON.parse(response.body)
     assert json['st'] == -2
  end


  test "#edit_profile_with_login" do
  	get :logout
  	post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
    post :edit_profile, {'email' => 'newemail@email.com', 'gender' => 1, 'birth' => '1994-05-13'}
    json = JSON.parse(response.body)
     assert json['st'] == 0
  end


  test "#edit_password_without_login" do
  	get :logout
  	post :edit_password
    json = JSON.parse(response.body)
    assert json['st'] == -2
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




   test "#login_success" do 
     post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
     json = JSON.parse(response.body)
     assert json['user_name'] == 'UserExample90'
   end

   test "#login_failure" do  
     post :login, {'name' => 'UserFailure', 'pass' => 'PassFailure'}
     json = JSON.parse(response.body)
     assert json['error_code'] == -4
   end

   test "#logout" do  
     get :logout
     assert_redirected_to accounts_index_path
   end


   test "#signup" do  
     post :signup, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
   end

  test "#edit_with_login" do
    get :logout
    post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
    get :edit
  end



  #FIXME
  test "#edit_password_with_login" do
    get :logout
    post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
    post :edit_password, {'pass_old' => 'PassExample90', 'pass_new'=> 'PassExample99'}
    json = JSON.parse(response.body)
     assert json['st'] == 0
  end
  
   test "#edit_password_with_login_2" do
     get :logout
     post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
     post :edit_password
     json = JSON.parse(response.body)
      assert json['st'] == -1
   end


	test "#create" do
   #    get :logout
#     get :signup, {'name' => 'UserExample90', 'pass' => 'PassExample90', 'gender' => 0, 'birth' => '1993-10-10', 'email' => 'user@example.com'}
   #	 post :create
         # json = JSON.parse(response.body)
#		assert json['st'] == 0
 # @account = Account.new('name' => 'UserExample90','pass' => 'PassExample90', 'gender' => 0, 'birth' => '1993-10-10', 'email' => 'user@example.com')
 # login @account
	#create @account

 # Account.request.params(:create).with({'name' => 'UserExample90', 'pass' => 'PassExample90', 'gender' => 0, 'birth' => '1993-10-10', 'email' => 'user@example.com'})
 # @request.account_params
  post :create, account: {'name' => 'UserExample90', 'pass' => 'PassExample90', 'gender' => 0, 'birth' => '1993-10-10', 'email' => 'user@example.com'}


  end

end



