Feature: Access DOM after javascript runs
  In order to verify javascript functions worked
  the development team should be able to 
  access the DOM after updates from javascript
  
  Scenario: javascript run "on page load"
    When I visit a page with javascript running on page load
    Then I should see a secret message "welcome from page load"
  
  Scenario: javascript run after clicking a button
    When I visit a page with javascript run after clicking a button
    And  I press 'Push me'
    Then I should see a secret message "That tickles!"
  
  Scenario: an AJAX call returning text
    When I visit a page making an AJAX call returning text
    And  I wait for the AJAX call to finish
    Then I should see a secret message "Simon says: surprise!"
  
  Scenario: an AJAX call returning javascript, executed automatically
    When I visit a page making an AJAX call returning javascript, executed automatically
    And  I wait for the AJAX call to finish
    Then Should work after celerity upgrades the bundled HtmlUnit
    And  I should see a secret message "Message for you sir!"
  
  Scenario: an AJAX call returning javascript, eval'ed on receipt
    When I visit a page making an AJAX call returning javascript and eval the response
    And  I wait for the AJAX call to finish
    Then I should see a secret message "Message for you sir!"
