Feature: Count money
    In order to manage accounts,
    Money should be summed properly.

    Scenario: Spending money
        Given I have an account with $1000
        When I buy holiday stuff
            | category | amount |
            | torch    | $20    |
            | tent     | $100   |
        Then account balance should be $880
        When I buy a sandwich
            | category | amount |
            | food     | $6     |
        Then account balance should be $874
