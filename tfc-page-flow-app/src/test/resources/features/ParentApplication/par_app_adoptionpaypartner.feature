Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionpaypartner"

Scenario Outline: The next page from website Parent Application is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNotAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfSomeButNotAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    |  | NEXT | Parent Application | /par/app/parentminincome |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/adoptionpaypartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNotAllChildrenSelected |
        | IfSomeButNotAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

