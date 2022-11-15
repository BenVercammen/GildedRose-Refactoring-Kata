package com.gildedrose;

import java.util.ArrayList;

class GildedRose {
    public static final String BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert";
    public static final String SULFURAS = "Sulfuras, Hand of Ragnaros";
    public static final String AGED_BRIE = "Aged Brie";

    /**
     * Public array of items kept in place for the goblin in the corner.
     * Will always be a copy of our stock, with {@link Item} being a copy as well to encapsulate our actual stock items.
     */
    Item[] items = new Item[0];

    /**
     * Private list of items for easier handling of stock changes.
     */
    private ArrayList<Item> stock;

    public GildedRose(Item[] items) {
        this.stock = new ArrayList<>();
        addItems(items);
    }

    public boolean addItem(Item item) {
        boolean result = stock.add(item);
        copyItems();
        return result;
    }

    private void copyItems() {
        items = new Item[stock.size()];
        int index = 0;
        for (Item stockItem : stock) {
            items[index++] = new Item(stockItem.name, stockItem.sellIn, stockItem.quality);
        }
    }

    public void addItems(Item... items) {
        for (Item item : items) {
            addItem(item);
        }
    }

    public boolean removeItem(Item item) {
        boolean result = stock.remove(item);
        copyItems();
        return result;
    }

    public Item removeItem(int index) {
        Item result = stock.remove(index);
        copyItems();
        return result;
    }

    /**
     * Update the quality of all items in stock
     */
    public void updateQuality() {
        for (Item item : stock) {
            if (!item.name.equals(AGED_BRIE)
                    && !item.name.equals(BACKSTAGE_PASSES)) {
                if (item.quality > 0) {
                    if (!item.name.equals(SULFURAS)) {
                        item.quality = item.quality - 1;
                    }
                }
            } else {
                if (item.quality < 50) {
                    item.quality = item.quality + 1;

                    if (item.name.equals(BACKSTAGE_PASSES)) {
                        if (item.sellIn < 11) {
                            if (item.quality < 50) {
                                item.quality = item.quality + 1;
                            }
                        }

                        if (item.sellIn < 6) {
                            if (item.quality < 50) {
                                item.quality = item.quality + 1;
                            }
                        }
                    }
                }
            }

            if (!item.name.equals(SULFURAS)) {
                item.sellIn = item.sellIn - 1;
            }

            if (item.sellIn < 0) {
                if (!item.name.equals(AGED_BRIE)) {
                    if (!item.name.equals(BACKSTAGE_PASSES)) {
                        if (item.quality > 0) {
                            if (!item.name.equals(SULFURAS)) {
                                item.quality = item.quality - 1;
                            }
                        }
                    } else {
                        item.quality = item.quality - item.quality;
                    }
                } else {
                    if (item.quality < 50) {
                        item.quality = item.quality + 1;
                    }
                }
            }
        }
        copyItems();
    }
}
