Given (/^I logged in as "(\w+)" with "(\w+)"$/) do |name, pass|
  visit('/')
  fill_in('name_input', :with => name)
  fill_in('pass_input', :with => pass)
  click_button('login_btn')
end

Given (/^I am on the mainpage$/) do
	visit('/suggestions')
end


Then(/^I see the first question and a set of five radio buttons for the answer$/) do
	assert page.has_content?("Are you starving to death?")
	page.should have_selector('li')  	
end
