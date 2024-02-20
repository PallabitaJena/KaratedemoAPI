Feature: Inter-Operability


  Scenario: calling Java Method
    * def JavaDemo = Java.type('examples.utils.JavaDemo')
    * def name = JavaDemo.getNameSong('Pallabita')
    * print name

  Scenario: calling java script from a file
    * def Compare = read('classpath:examples/resources/Compare.js')
    * call Compare '@tag1'

  Scenario: in-line js function
    * def quack = function(){ karate.log('quack!') }

    * quack()

