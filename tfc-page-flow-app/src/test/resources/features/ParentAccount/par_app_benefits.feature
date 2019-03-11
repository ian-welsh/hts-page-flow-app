Feature: Is the Parent Account /par/app/benefits page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/benefits"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit | NEXT | Parent Account | /par/app/parenttype |
    | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit | NEXT | Parent Account | /par/app/parenttype |
    | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE | NEXT | Parent Account | /par/app/exit |
    | OnlySelectedTaxCreditsButNotEligibleForDFE | NEXT | Parent Account | /par/app/taxcreditswarning |
    | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers | NEXT | Parent Account | /par/app/taxcredits |
    | IfSelectedChildcareVouchers | NEXT | Parent Account | /par/app/registeredschemes |
    |  | NEXT | Parent Account | /par/app/parenttype |
    |  | NEXT | Parent Account | /par/app/parenttype |

Scenario: Parent Account page /par/app/benefits with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit |
        | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit |
        | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE |
        | OnlySelectedTaxCreditsButNotEligibleForDFE |
        | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers |
        | IfSelectedChildcareVouchers |

