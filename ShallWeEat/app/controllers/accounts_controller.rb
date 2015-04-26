class AccountsController < ApplicationController


  def index
  end


  def signup
		@account = Account.new
  end

	def create
		@account = Account.new(account_params)
		if @account.save
			redirect_to @account
		else
			redirect_to :back
		end
	end

	def show
		@account = Account.find(params[:id])

	end


  
  def login
    @account = Account.find_by(name: params[:name])

    if @account && @account.pass == params[:pass]#&& @account.authenticate(params[:pass])
      @account.pass = params[:pass]
      @account.save
      log_in @account
      render :json => { user_name: params[:name]}
    else
      render :json => { error_code: -4 }
    end
  end


  private
	def account_params
		params.require(:account).permit(:name,:pass, :gender, :birth, :email)
	end


end
