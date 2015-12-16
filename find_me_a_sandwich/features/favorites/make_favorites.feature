Feature: Make Favorites
  As a user
  I want to favorite my meals
  In order to find them later

  Background:
    Given I have a valid account
    And I am logged in

  Scenario: Adding a favorite
    Given I am on a meal page
    When I click favorite
    And I click the favorites page link
    Then the meal is visible my account as a favorite

  Scenario: duplicate favoriting
    Given I am on a meal page
    When that meal is already a favorite
    Then there is no favorite button