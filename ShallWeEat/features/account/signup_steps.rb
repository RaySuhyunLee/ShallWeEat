Given /^I am on my homepage$/ do
	visit '/'
end

When /^I signup as "(\w+)" with "(\w+)" with "(\w+)" with "(\w+)" with "(\w+)"$/ do |name, pass, email, gender, birth|
	click_button('signup_btn')
  visit '/accounts/signup'
  account = Account.new( {name: username, pass: password, email: "user@example.com", gender: 0, birth: "1993-07-19"} )
  account.save

  	fill_in "name_input", :with => @account[:name]
  	fill_in "pass_input", :with => @account[:pass]
  	fill_in "email_input", :with => @account[:email]
  	fill_in "gender_input", :with => @account[:gender]
  	fill_in "birth_input", :with => @account[:birth]
  	click_button "Create my acount!"
end

Then /^I am on the login page$/ do
	visit '/'
end
