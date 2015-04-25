class AccountController < ApplicationController
  include AccountHelper

  def index
  end
  

  
  def login
   @account = Account.find_by(name: params[:name])

    if @account && @account.authenticate(params[:pass])
      @account.pass = params[:pass]
      @account.save
      log_in @account
      render :json => { user_name: params[:name]}
    else
      render :json => { error_code: -4 }
    end
  end


  def signup
    redirect_to root_path
  end

  def user_params
    params.permit(:name, :pass)
  end

end
