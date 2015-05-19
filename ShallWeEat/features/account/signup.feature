Feature: User can signup

@javascript
Scenario: User tries to signup
Given I am on my homepage
When I signup as "username" with "password"
Then I see my information
