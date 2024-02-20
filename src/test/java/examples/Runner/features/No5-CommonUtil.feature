Feature: Some commonly used method
  @smoke
  Scenario:System Time (as a string)
  * def systemTime =
  """
  function(){ return java.lang.System.currentTimeMillis() + '' }
  """
    * def temp = systemTime()
    * print temp
  @smoke
    Scenario: Random Number (0 to max-1)
      * def RenadomNum =
      """
      function(max){ return Math.floor(Math.random() * max) }
      """
      * def temp = RenadomNum(10)
      * print temp
  @smoke
  Scenario: Case Insensitive Comparison
    * def checkcasesensitive =
      """
      function(a, b){ return a.equalsIgnoreCase(b) }
      """
    * def temp = checkcasesensitive('Pall','Pall')
    * print temp
  @smoke
  Scenario: Sleep or Wait for pause milliseconds
    * def wait =
      """
      function(pause){ java.lang.Thread.sleep(pause) }
      """
    * def temp = wait(6)
    * print temp