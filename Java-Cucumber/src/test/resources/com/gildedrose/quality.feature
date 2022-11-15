Feature: Gilded Rose quality
  I want to know if the quality is updated properly

#
#
#
# We have recently signed a supplier of conjured items. This requires an update to our system:
#
# 	- "Conjured" items degrade in Quality twice as fast as normal items
#
# Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
# still works correctly. However, do not alter the Item class or Items property as those belong to the
# goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
# ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
# for you).
#
# Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a.
#

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
      | Foo  | 10      | 0       |
    When I update the quality
    Then the stock should contain the following items
      | Name | Quality | Sell in |
      | Foo  | 8       | -1      |


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

