Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/workstartdate"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | Parent Account | /par/app/exit |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | Parent Account | /par/app/exit |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    |  | NEXT | Parent Account | /par/app/otherleavepaytype |
    |  | NEXT | Parent Account | /par/app/otherleavepaytype |

Scenario: Parent Account page /par/app/workstartdate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |

