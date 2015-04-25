class AccountController < ApplicationController
	def edit
		@user = Account.new(name: 'test', pass: 'test', email: 'test')
	end
	def edit_profile
		#@user = Account.find_by(name: '')
		@user = Account.new(name: 'test')
	end
	def edit_password
		#@user = Account.find_by(name: '')
		@user = Account.new(name: 'test')
		
		if param[:pass_old] == user.pass
			@user.pass = param[:pass_new]
			@user.save
			status = 0
		else
			status = 1
		end

		respond_to do |format|
			format.json {render :json => {:st => status}}
		end
	end
end
