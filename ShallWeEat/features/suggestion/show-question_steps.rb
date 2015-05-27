#Given /^I logged in as "(\w+)" with "(\w+)"$/ do |name, pass|
#  visit('/')
#  fill_in('name_input', :with => name)
#  fill_in('pass_input', :with => pass)
#  click_button('login_btn')
#end
Given "I logged in as $count with $count" do |name, pass|
  visit('/')
  fill_in('name_input', :with => name)
  fill_in('pass_input', :with => pass)
  click_button('login_btn')
end

#When "I am on the main page" do
#  visit '/suggestions/questions'
#end

#Then /^I see the first question and a set of five radio buttons for the answer$/ do
#	assert page.has_content?("Are you starving to death?")
#	page.should have_selector('li')
#end
