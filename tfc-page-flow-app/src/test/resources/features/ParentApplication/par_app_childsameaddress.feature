Feature: Is the Parent Application /par/app/childsameaddress page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/childsameaddress"

Scenario Outline: The next page from website Parent Application is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStayOnTheSameAddress | NEXT | Parent Application | /par/app/disabilityquestions |
    |  | NEXT | Parent Application | /par/app/childsaddress |

Scenario: Parent Application page /par/app/childsameaddress with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStayOnTheSameAddress |

