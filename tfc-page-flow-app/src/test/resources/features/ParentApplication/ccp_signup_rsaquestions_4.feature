Feature: Is the Parent Application /ccp/signup/rsaquestions/4 page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/ccp/signup/rsaquestions/4"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | Parent Application | /par/app/rsaquestions/5 |
    |  | NEXT | Parent Application | /ccp/signup/rsaquestions/5 |

