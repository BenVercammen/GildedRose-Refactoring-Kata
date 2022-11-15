Feature: Gilded Rose quality for Aged Brie


  # "Aged Brie" actually increases in Quality the older it gets
  Scenario: "Aged Brie" actually increases in Quality the older it gets
    Given the following items are in stock
      | Name      | Quality | Sell in |
      | Aged Brie | 10      | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 11      | 4       |


  # The Quality of an item is never more than 50
  Scenario: Aged Brie cannot have quality over 50
    Given the following items are in stock
      | Name      | Quality | Sell in |
      | Aged Brie | 50      | 5       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 50      | 4       |


  # Even after expiration date, quality increases
  Scenario: Aged Brie increases in quality after expiration date
    Given the following items are in stock
      | Name      | Quality | Sell in |
      | Aged Brie | 10      | 1       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 11      | 0       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 13      | -1       |
    When I update the quality
    Then the stock should contain the following items
      | Name      | Quality | Sell in |
      | Aged Brie | 15      | -2       |

