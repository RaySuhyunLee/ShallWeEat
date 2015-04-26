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
			render 'signup'
		end
	end

	def edit
		@user = Account.new(name: 'test', pass: 'test', email: 'test', gender: 0, birth: '19940513')
	end

	def edit_profile
		@user = Account.find_by(name: 'test')
		
		if @user.nil?
			# error
			status = -1
		else
			@user.email = params[:email]
			@user.gender = params[:gender]
			@user.birth = params[:birth]
			@user.save
			status = 0
		end

		respond_to do |format|
			format.json {render :json => {:st => status}}
		end
	end
	def edit_password
		@user = Account.find_by(name: 'test')
		#Account.destroy_all
		#@user = Account.new(name: 'test', pass: 'test')
		
		if params[:pass_old] == @user.pass
			@user.pass = params[:pass_new]
			@user.save
			status = 0
		else
			status = -1
		end

		respond_to do |format|
			format.json {render :json => {:st => status}}
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
