Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/registereddetails"

Scenario Outline: The next page from website CIC Website is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | RegulatorIsMOD | NEXT | CIC Website | /ccp/signup/bankaccountcountry |
    | RegulatorIsMOD | NEXT | CIC Website | /ccp/signup/bankaccountcountry |
    |  | NEXT | CIC Website | /ccp/signup/ninoutr |
    |  | NEXT | CIC Website | /ccp/signup/ninoutr |

Scenario: CIC Website page /ccp/signup/registereddetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | RegulatorIsMOD |
        | RegulatorIsMOD |

