Feature: User can add manually a recipe after registration
  come utente registrato
  in modo che possa dare un contributo personale al sito
  voglio aggiungere una ricetta

Background:
  Given I am a registered user
  And I am on the home page
  When I follow "Login"
  Then I should be on the login page
  When I fill in "Email" with "test@gmail.com"
  And I fill in "Password" with "password"
  And I press "Login"
  Then I should be on the home page

Scenario: Add a recipe
  Given I am on the home page
  When I follow "Profile"
  Then I should be on the profile page
  When I follow "Publish your recipe"
  Then I should be on the new recipe page
  When I fill in "Title" with "Pizza alla Diavola"
  And I select "Main Course" from "Typology"
  And I fill in "Description" with "Pizza col sugo di pomodoro e salame piccante"
  And I press "Create Recipe"
  Then I should be on the video uploads page
  When I follow "continue without uploading a video"
  Then I should see "test@gmail.com"
  And I should not see "No recipes published by this user..."
  And I should see "Pizza Alla Diavola"

Scenario: Check if recipe exists
  Given I created a recipe named "Pizza Alla Diavola"
  And I am on the home page
  When I follow "User Recipes"
  Then I should be on the recipe list page
  And I should see "Pizza Alla Diavola"
  When I follow "Show"
  Then I should be on the recipe info page
  And I should see "Pizza Alla Diavola"
  And I should see "test@gmail.com"
  And I should see "Main Course"
  And I should see "Pizza col sugo di pomodoro e salame piccante"