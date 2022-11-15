Feature: Gilded Rose quality for Sulfuras


  # "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
  Scenario: Sulfuras never drops in quality or sell in date
    Given the following items are in stock
      | Name                       | Quality | Sell in |
      | Sulfuras, Hand of Ragnaros | 80      | 0       |
    When I update the quality
    Then the stock should contain the following items
      | Name                       | Quality | Sell in |
      | Sulfuras, Hand of Ragnaros | 80      | 0       |

