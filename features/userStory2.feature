Feature: user authentication

  Scenario: user logs in (happy path)
    Given a user with username "test" and password "password"
    Given I am on the sign in page
    When I sign in as "test" with password "password"
    Then I should be on the sign in page

  Scenario: user logs out (happy path)
    Given I am signed in with username "test_user" and password "password"
    When I follow "Logout"
    Then I should be on the sign in page
  
  Scenario: User fails to log in because of invalid password (sad path)
    Given a user with username "test" and password "password"
    Given I am on the sign in page
    When I sign in as "test" with password "wrong_password"
    Then I should be on the sign in page
