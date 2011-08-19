Feature: Account details
In order to access the transactions of an account,
   Account transaction atoms should be shown on a page.

Scenario: Links to account details
   Given I have an account "Account 1" with $1500
   When I go to the home page
   When I follow "Account 1"
   Then I should be on atom transactions index of "Account 1"
