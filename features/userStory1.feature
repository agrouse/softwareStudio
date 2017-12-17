Feature: user sign up

  Scenario: user signs up successfully (happy path)
    Given I am on the sign up page
    When I fill in "testing" for "First name"
    When I fill in "testing" for "Last name"
    When I fill in "testing1" for "User name"
    When I fill in "password" for "Password"
    When I fill in "password" for "Confirm password"
    When I press "submit"
    Then user "testing1" should exist
  Scenario: User fails to sign up because of invalid password confirmation (sad path)
   Given I am on the sign up page
    When I fill in "testing2" for "First name"
    When I fill in "testing2" for "Last name"
    When I fill in "testing2" for "User name"
    When I fill in "password" for "Password"
    When I fill in "not_password" for "Confirm password"
    When I press "submit"
    Then user "testing2" should not exist