require 'test_helper'

#Account / Accounts?
class AccountHelperTest < ActionView::TestCase

  test "#log_in" do
  #	@current_account = Account.create(:account)
   # @current_account.nil?
   #session[:account_id] = account.id

  # get :logout
   #post :login, account: account.id

      account = Account.new :name => 'UserExample90'
      controller.session[:account_id] = account.id

     # post :login, {'name' => 'UserExample90', 'pass' => 'PassExample90'}
      #expect(session[:account]).to eq(account.id)

      #logout
      #expect(session[:account]).to be_nil
   
  end

  test "#current_account" do


   # account = Account.new # or whatever
   # view.stub!(:current_user).and_return(user)
    #controller.stub!(:current_user).and_return(user)
    # assert true
   # assert_not_nil current_account
   # Account.current = (session[:account_id]) ? Account.find_by_id(session[:account_id]) : nil
  end
  
   test "#logged_in?" do
   # !current_account.nil?
    # assert true


    
  end


end