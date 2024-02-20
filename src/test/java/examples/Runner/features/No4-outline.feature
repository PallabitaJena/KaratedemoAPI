Feature: operation having scenario outline

  Scenario Outline:To Print
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print '<status>'

    @QA
    Examples:
      | url                                  | path     | method | status |
      | https://restful-booker.herokuapp.com | /booking | get    | 200    |
      | https://restful-booker.herokuapp.com | /booking | get    | 200    |
      | https://restful-booker.herokuapp.com | /booking | Delete | 200    |


    @Prod
    Examples:
      | url                                  | path     | method | status |
      | https://restful-booker.herokuapp.com | /booking | get    | 200    |
      | https://restful-booker.herokuapp.com | /booking | get    | 200    |
      | https://restful-booker.herokuapp.com | /booking | Delete | 200    |
