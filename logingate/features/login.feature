Feature: Sign-In

  @android
  Scenario: Successful Sign-In
    Given a user is on the login page
    And a user has entered valid credentials
    When the user attempts to sign in
    And the user should be successfully signed in toast message
