Feature: friends favorites
  As a user
  I want to find the favorite meals of my friends
  In order to decide what to eat

  Background:
    Given I have a valid account
    And I am logged in

  Scenario: Happy
    Given I am on the home page
    And I have friends who have favorites
    When I click the friends favorites button
    Then I see my friends favorites

  Scenario: Sad
    Given I am on the home page
    And I have friends who do not have favorites
    When I click the friends favorites button
    Then I am informed that my friends have no favorites

  Scenario: Bad
    Given I am on the home page
    And I have no friends
    When I click fthe friends favorites button
    Then I am informed that I have no friends