Feature: Is the CCP Account /ccp/acc/resetpassword page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/resetpassword"

Scenario Outline: The next page from website CCP Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaSetup | NEXT | CCP Account | /ccp/acc/changeforgottenpassword |
    |  | NEXT | CCP Account | /ccp/acc/passwordresetnorsa |

Scenario: CCP Account page /ccp/acc/resetpassword with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isRsaSetup |

