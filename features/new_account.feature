Feature: Create an account
Accounts must be creatable from the home page

Scenario: Accessing the home page
When I go to the home page
When I follow "New account"
Then I should be on new account
