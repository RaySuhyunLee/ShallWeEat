Feature: User can login

@javascript
Scenario: User tries to login

Given I signed up as "username" with "password"
When I login as "username" with "password"
Then I see a successful message
