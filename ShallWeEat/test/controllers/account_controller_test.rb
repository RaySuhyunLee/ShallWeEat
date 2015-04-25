require 'test_helper'

class AccountControllerTest < ActionController::TestCase
   test "#login_success" do
     post :login, {'name' => 'UserExample', 'pass' => 'PassExample'}
     json = JSON.parse(response.body)
     assert json['user_name'] == 'UserExample'
   end

   test "#login_failure" do
     post :login, {'name' => 'UserFailure', 'pass' => 'PassFailure'}
     json = JSON.parse(response.body)
     assert json['error_code'] == -4
   end

end
