Feature: Show questions to user


@javascript 
Scenario: Main page shows questions and the answers that user can choose
	
	Given I logged in as "username" with "password"
	And I am on the mainpage
	Then I see the first question and a set of five radio buttons for the answer
