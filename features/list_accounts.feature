Feature: List accounts
In order to quickly access the status of accounts,
   Account statuses should be shown on the first page.

   Scenario: No account
      When I go to the home page
      Then I should see a table "#accounts_list" containing:
         | Total | $0.00 |

   Scenario: Listing accounts
      Given I have an account "Account 1" with $1500
      Given I have an account "Account 2" with $2500
      When I go to the home page
      Then I should see a table "#accounts_list" containing:
         | Account 1 | $1,500.00 |
         | Account 2 | $2,500.00 |
         | Total     | $4,000.00 |
      Given I have an account "Account 3" with -$500
      When I go to the home page
      Then I should see a table "#accounts_list" containing:
         | Account 1 | $1,500.00 |
         | Account 2 | $2,500.00 |
         | Account 3 | -$500.00 |
         | Total     | $3,500.00 |
