Feature: Is the CIC Parent Account /par/app/parentselfemployapplied page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parentselfemployapplied"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAppliedMoreThan6WeeksAgo | NEXT | CIC Parent Account | /par/app/exit |
    | IfAppliedMoreThan6WeeksAgo | NEXT | CIC Parent Account | /par/app/exit |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytype |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytype |

Scenario: CIC Parent Account page /par/app/parentselfemployapplied with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAppliedMoreThan6WeeksAgo |
        | IfAppliedMoreThan6WeeksAgo |

