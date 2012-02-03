Feature: Manage bookmarks
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new bookmark
    Given I am on the new bookmark page
    When I fill in "Url" with "url 1"
    And I fill in "Notes" with "notes 1"
    And I press "Create"
    Then I should see "url 1"
    And I should see "notes 1"

  Scenario: Delete bookmark
    Given the following bookmarks:
      |url|notes|
      |url 1|notes 1|
      |url 2|notes 2|
      |url 3|notes 3|
      |url 4|notes 4|
    When I delete the 3rd bookmark
    Then I should see the following bookmarks:
      |Url|Notes|
      |url 1|notes 1|
      |url 2|notes 2|
      |url 4|notes 4|
