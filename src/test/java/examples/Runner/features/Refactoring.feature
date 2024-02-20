Feature: how you can define custom keywords

  Background:
    * call read('commonuse.feature')


  Scenario Outline: Using Conditional Logic for Data Selection
    * def tag = '<tag>'
    * def data = read('classpath:examples/resources/data.json')
    * def dataRow = karate.filter(data, row => row.tags.includes(tag))[0]

    Then dataRow.value == <value>
    Then def val = dataRow.value
    * print val
    * def result = call Compare tag
    * print result
    Examples:
      | tag   | value |
      | @tag1 | 100   |
      | @tag2 | 200   |

