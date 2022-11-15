Feature: Gilded Rose quality for Conjured items

  # At the end of each day our system lowers both values for every item
  Scenario: Normal quality devaluation
    Given the following items are in stock
      | Name     | Quality | Sell in |
      | Conjured | 10      | 20      |
    When I update the quality
    Then the stock should contain the following items
      | Name     | Quality | Sell in |
      | Conjured | 8       | 19      |


  # Once the sell by date has passed, Quality degrades twice as fast
  Scenario: Once the sell by date has passed, Quality degrades twice as fast
    Given the following items are in stock
      | Name     | Quality | Sell in |
      | Conjured | 10      | 1       |
    When I update the quality
    Then the stock should contain the following items
      | Name     | Quality | Sell in |
      | Conjured | 8       | 0       |
    When I update the quality
    Then the stock should contain the following items
      | Name     | Quality | Sell in |
      | Conjured | 4       | -1      |


