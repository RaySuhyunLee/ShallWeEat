class AccountsController < ApplicationController
	def signup
	  @account = Account.new
	end
	def create
		@account = Account.new(account_params)
		if @account.save
			redirect_to @account
		else
			render 'signup'
		end
	end

	def show
		@account = Account.find(params[:id])

	end

	private
		def account_params
			params.require(:account).permit(:name,:pass, :gender, :birth, :email)
		end


end
