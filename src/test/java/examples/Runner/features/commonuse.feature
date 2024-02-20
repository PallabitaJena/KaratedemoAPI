@ignore
Feature:

  Scenario:
# in-line js function
    * def quack = function(){ karate.log('quack!') }

# js function from file
    * def Compare = read('classpath:examples/resources/Compare.js')

