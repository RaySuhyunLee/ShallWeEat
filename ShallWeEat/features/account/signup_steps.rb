Given /^I am on my homepage$/ do
visit('/')
end

When /^I signup as "(\w+)" with "(\w+)"$/ do |name, pass|
fill_in(‘name_input', :with => name)
fill_in(‘pass_input', :with => pass)
click_button(‘signup_btn’)
end

Then /^I see my info$/ do
assert page.has_content?("information")
end
