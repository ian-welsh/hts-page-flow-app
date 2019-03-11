Feature: Is the Parent Application /par/app/partnerselfemployapplied page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerselfemployapplied"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAppliedMoreThan6WeeksAgo | NEXT | Parent Application | /par/app/exit |
    | IfAppliedMoreThan6WeeksAgo | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/otherleavepaytypepartner |
    |  | NEXT | Parent Application | /par/app/otherleavepaytypepartner |

Scenario: Parent Application page /par/app/partnerselfemployapplied with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAppliedMoreThan6WeeksAgo |
        | IfAppliedMoreThan6WeeksAgo |

