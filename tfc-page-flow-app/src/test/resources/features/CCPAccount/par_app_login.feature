Feature: Is the CCP Account /par/app/login page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/par/app/login"

Scenario Outline: The next page from website CCP Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CCP Account | /par/app/entrypointpost |
    |  | NEXT | CCP Account | /par/acc/entrypointpost |
    |  | NEXT | CCP Account | /ccp/acc/entrypointpost |

