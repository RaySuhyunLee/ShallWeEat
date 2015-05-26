Given "I signed up as $count with $count" do |name, pass|
account = Account.new({name: name, pass: pass})
account.save
end


When "I login up as $count with $count" do |name, pass|
visit '/'
fill_in('name_input', :with => name)
fill_in('pass_input', :with => pass)
click_button('login_btn')
end


Then /^I see a successful message$/ do
	page.should have_content “Welcome to join us!”
end