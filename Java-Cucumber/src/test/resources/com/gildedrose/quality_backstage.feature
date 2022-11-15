Feature: Gilded Rose quality for backstage passes

  # "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
  #  - Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
  #  - Quality drops to 0 after the concert
  Scenario: Backstage passes cannot have quality over 50
    Given the following items are in stock
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 50      | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 50      | 4       |


  Scenario: Backstage passes increase in quality when sell in date > 10
    Given the following items are in stock
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 15      |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 11      | 14      |


  Scenario: Backstage passes increase in quality when sell in date < 10 and > 5
    Given the following items are in stock
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 11      |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 11      | 10      |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 13      | 9       |


  Scenario: Backstage passes increase in quality when sell in date < 5
    Given the following items are in stock
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 6       |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 12      | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 15      | 4       |


  Scenario: Backstage passes lose quality when sell in date < 0
    Given the following items are in stock
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 1       |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 13      | 0       |
    When I update the quality
    Then the stock should contain the following items
      | Name                                      | Quality | Sell in |
      | Backstage passes to a TAFKAL80ETC concert | 0       | -1      |

