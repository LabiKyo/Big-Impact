Feature: User login feature
  As a fellow that haven't logged in
  I want to login
  So that I can use this SNS

  Background:
    Given I am on index page

  Scenario: Index page
    Then I should see Login form
    And I should see Email field
    And I should see Password field
    And I should see I'm admin checkbox
    And I should see Login button

  Scenario: Fellow login
    When I fill Email field with '123456@omar.com'
    And I fill Password field with '123456'
    And I uncheck I'm admin checkbox
    And I click Login button
    Then I should navigate to profile page
    And I should see success message 'Login success!'

  Scenario: Fellow login with wrong password
    When I fill Email field with '123456@omar.com'
    And I fill Password field with '654321'
    And I uncheck I'm admin checkbox
    And I click Login button
    Then I should see error message 'Email or password is not correct!'
