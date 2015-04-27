class AccountsController < ApplicationController

  def index
  end

  def login
    @account = Account.find_by(name: params[:name])

    if @account && @account.pass == params[:pass]#&& @account.authenticate(params[:pass])
			# store session key
			session[:name] = @account.name
      #log_in @account
      render :json => { user_name: params[:name]}
    else
      render :json => { error_code: -4 }
    end
  end

  def signup
		@account = Account.new
  end
  
	def create
		@account = Account.new(account_params)

		if @account.save
			render :json => { :st => 0 }
		else
			#render :json => { :st => -1}
			render :signup 
		end
	end

	def edit
		name = session[:name]
		if name.nil?
			redirect_to :accounts_index
		else
			@user = Account.find_by(name: name)
		end
	end

	def edit_profile
		name = session[:name]
		@user = Account.find_by(name: name)
		
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
		name = session[:name]
		@user = Account.find_by(name: name)
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
		name = session[:name]
		if name.nil?
			redirect_to :accounts_index
		else
			@account = Account.find_by(name: name)
		end
	end

	def logout
		session[:name] = nil
		redirect_to :accounts_index
	end

  private
	def account_params
		params.require(:account).permit(:name,:pass, :gender, :birth, :email)
	end


end
