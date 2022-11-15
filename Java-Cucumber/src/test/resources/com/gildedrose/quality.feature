Feature: Gilded Rose quality
  I want to know if the quality is updated properly


  # At the end of each day our system lowers both values for every item
  Scenario: Normal quality devaluation
    Given the following items are in stock
      | Name | Quality | Sell in |
      | Foo  | 10      | 20      |
    When I update the quality
    Then the stock should contain the following items
      | Name | Quality | Sell in |
      | Foo  | 9       | 19      |


  # Once the sell by date has passed, Quality degrades twice as fast
  Scenario: Once the sell by date has passed, Quality degrades twice as fast
    Given the following items are in stock
      | Name | Quality | Sell in |
      | Foo  | 10      | 1       |
    When I update the quality
    Then the stock should contain the following items
      | Name | Quality | Sell in |
      | Foo  | 9       | 0      |
    When I update the quality
    Then the stock should contain the following items
      | Name | Quality | Sell in |
      | Foo  | 7       | -1      |


  # The Quality of an item is never negative
  Scenario: The Quality of an item is never negative
    Given the following items are in stock
      | Name | Quality | Sell in |
      | Foo  | 0       | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name | Quality | Sell in |
      | Foo  | 0       | 4       |


  # The Quality of an item is never more than 50
  Scenario: Aged Brie cannot have quality over 50
    Given the following items are in stock
      | Name      | Quality | Sell in |
      | Aged Brie | 50      | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 50      | 4       |

