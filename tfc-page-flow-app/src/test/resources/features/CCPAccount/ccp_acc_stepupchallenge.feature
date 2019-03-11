Feature: Is the CCP Account /ccp/acc/stepupchallenge page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/stepupchallenge"

Scenario Outline: The next page from website CCP Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaFailure | CONTINUE | CCP Account | /ccp/acc/rsaquestionsfailure |
    | isRsaWarning | CONTINUE | CCP Account | /ccp/acc/rsaquestionswarning |
    |  | FRGTANSWER | CCP Account | /ccp/acc/passwordentryrsa |

Scenario: CCP Account page /ccp/acc/stepupchallenge with action CONTINUE rules are ordered correctly
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | isRsaFailure |
        | isRsaWarning |

