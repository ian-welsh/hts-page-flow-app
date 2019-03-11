Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/apprenticeminpaypartner"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromPartnerApprenticeMinPayToExit | NEXT | CIC Parent Reg | /par/app/exit |
    | NavFromPartnerApprenticeMinPayToExit | NEXT | CIC Parent Reg | /par/app/exit |
    | NavFromPartnerApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Reg | /par/app/maxpaythreshold |
    | NavFromPartnerApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Reg | /par/app/maxpaythreshold |

Scenario: CIC Parent Reg page /par/app/apprenticeminpaypartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromPartnerApprenticeMinPayToExit |
        | NavFromPartnerApprenticeMinPayToExit |
        | NavFromPartnerApprenticeMinPayToMaxPayThreshold |
        | NavFromPartnerApprenticeMinPayToMaxPayThreshold |

