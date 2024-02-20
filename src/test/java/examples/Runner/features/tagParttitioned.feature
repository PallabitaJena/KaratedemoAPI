Feature:

Scenario Outline: examples partitioned by tag
* def vals = karate.tagValues
* match vals.region[0] == '<expected>'

@region=QA
Examples:
| expected |
| QA       |

@region=Prod
Examples:
| expected |
| Prod       |