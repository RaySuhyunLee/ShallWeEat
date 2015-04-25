class AccountController < ApplicationController
	def edit
		@user = Account.new(name: 'test', pass: 'test', email: 'test')
	end
	def edit_profile
		#@user = Users.find_by name: ''
		@user = Account.new(name: 'test')
	end
end
