Feature: Group Management
  As Professor Xavier
  I want to be able to build up a Group of Mutants
  and assign Tasks to them.

  Scenario: Create a new Group of Mutants and Assign Tasks to Them
    Given A list of tasks
      | Name              |
      | Kill Aardwolf     |
      | Help Tyger Tiger  |
      | Destroy Mammomax  |
    And A list of Mutants
      | Name    |
      | Hellion |
      | Selene  |
      | Trance  |
    When I visit the page to create a new Group
     And I fill in the name of the Group with "Super G-I"
     And I add the following Mutants to the Group
       | Name    |
       | Hellion |
       | Selene  |
     And I add the following Tasks to the Group
       | Name              |
       | Help Tyger Tiger  |
       | Destroy Mammomax  |
    When I click the create group button
    Then I see a message that group has been created successfully
     And New group has the following Mutants inside
       | Name    |
       | Hellion |
       | Selene  |
     And New group has been assigned the following Tasks
       | Name              |
       | Help Tyger Tiger  |
       | Destroy Mammomax  |
