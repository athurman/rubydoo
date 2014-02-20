Feature: Search for Shelters
  In order to adopt a dog
  As a person in a certain area
  I want to anonymously find shelters in my area

  Scenario: Inputting random text for zipcode fails
    When I go to the homepage
    Then I should see "rubydoo"
    When I press "Search for Shelters in Your Area"
    Then I should see "Please Enter Your Zipcode"
    When I fill in "Please Enter Your Zipcode" with "asdfgh"
    Then I should see "Invalid Zipcode, please try again"

  Scenario: Inputting random text for zipcode fails
    When I go to the homepage
    Then I should see "rubydoo"
    When I press "Search for Shelters in Your Area"
    Then I should see "Please Enter Your Zipcode"
    When I fill in "Please Enter Your Zipcode" with "37207"
    Then I should see "Shelters in Your Area:"