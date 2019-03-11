Feature: Is the Parent Account /par/app/entrypointpost page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/entrypointpost"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaBlocked | NEXT | Parent Account | /par/acc/rsaquestionsfailure |
    | ParentHasAcctNoPasswordNavRule | NEXT | Parent Account | /par/acc/setpassword |
    | ParentHasAcctWithTempPasswordNavRule | NEXT | Parent Account | /par/acc/resetpassword |
    | ParentHasAcctWithNoRsaDetailsNavRule | NEXT | Parent Account | /par/acc/rsasetupnotice |
    | AccountHasMatchingFailure | NEXT | Parent Account | /par/acc/matchingfailure |
    | ParentIdaEgibilityNotConfirmedNavRule | NEXT | Parent Account | /par/acc/delayedeligibilityresponse |
    |  | NEXT | Parent Account | /par/acc/accounthomepage |

Scenario: Parent Account page /par/app/entrypointpost with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isRsaBlocked |
        | ParentHasAcctNoPasswordNavRule |
        | ParentHasAcctWithTempPasswordNavRule |
        | ParentHasAcctWithNoRsaDetailsNavRule |
        | AccountHasMatchingFailure |
        | ParentIdaEgibilityNotConfirmedNavRule |

