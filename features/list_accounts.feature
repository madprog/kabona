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
         | Account 3 |  -$500.00 |
         | Total     | $3,500.00 |

   Scenario: Negative numbers
      Given I have an account "Account 1" with $500
      Given I have an account "Account 2" with -$1500

      When I go to the home page

      # Account 1 row
      Then I should see an element "#accounts_list td.value" matching /\$500\.00/
      Then I shouldn't see an element "#accounts_list td.value.negative" matching /\$500\.00/
      # Account 2 row
      Then I should see an element "#accounts_list td.value.negative" matching /-\$1,500\.00/
      # Total row
      Then I should see an element "#accounts_list td.value.negative" matching /-\$1,000\.00/

      Given I have an account "Account 3" with $1000

      When I go to the home page
      # Total row
      Then I should see an element "#accounts_list td.value" matching /\$0\.00/
      Then I shouldn't see an element "#accounts_list td.value.negative" matching /\$0\.00/

