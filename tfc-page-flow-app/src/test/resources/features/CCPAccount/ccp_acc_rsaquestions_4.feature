Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestions/4"

Scenario Outline: The next page from website CCP Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isForgotQuestions | NEXT | CCP Account | /ccp/acc/rsaquestions/5 |
    | isMorePages | NEXT | CCP Account | /ccp/acc/rsaquestions |
    | isUpdateTelephone | NEXT | CCP Account | /ccp/acc/rsaphonenumber |
    | isRsaPending | NEXT | CCP Account | /ccp/acc/rsaquestions/5 |
    |  | NEXT | CCP Account | /ccp/acc/rsathankyou |

Scenario: CCP Account page /ccp/acc/rsaquestions/4 with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isForgotQuestions |
        | isMorePages |
        | isUpdateTelephone |
        | isRsaPending |

