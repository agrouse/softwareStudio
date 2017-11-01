Feature: User can delete a chore once it has been completed
Scenario: Delete a chore
Given I am on the Menage home page
When I follow "delete"
Then I should be on the home page 
And the row with the deleted chore should no longer be seen