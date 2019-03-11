Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnermaxpaythreshold"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | Parent Account | /par/app/exit |
    | IfHasTfcOnly | NEXT | Parent Account | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | Parent Account | /par/app/stoptaxcreditswarning |
    |  | NEXT | Parent Account | /par/app/declaration |

Scenario: Parent Account page /par/app/partnermaxpaythreshold with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasTfcOnly |
        | IfHasTfcAndDfe |

