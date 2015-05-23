Feature: Show questions to user


@javascript 
Scenario: Main page shows questions and the answers that user can choose
	
	Given I logged in as "username" with "password"
	When I am on the main page
	Then I see the first question and a set of five radio buttons for the answer
