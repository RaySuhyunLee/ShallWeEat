Feature: User can signup

@javascript
Scenario: User tries to signup

Given I am on my homepage
When I signup as "username" with "password" with "email@email.com" with "0" with "1993-07-19"
Then I am on the login page
