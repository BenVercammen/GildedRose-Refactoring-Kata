package com.gildedrose;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class GildedRoseStockTest {

    @Test
    void defaultStock() {
        Item[] items = new Item[] { new Item("foo", 0, 0) };
        GildedRose app = new GildedRose(items);
        app.updateQuality();
        assertEquals("foo", app.items[0].name);
        assertEquals(-1, app.items[0].sellIn);
        assertEquals(0, app.items[0].quality);
    }

    /**
     * In order not to allow tinkering with the actual stock,
     * the list of items we return are copies of the actual items in stock.
     */
    @Test
    void itemsArrayShouldBeCopyOfActualStockItems() {
        GildedRose app = new GildedRose(new Item[] { new Item("apple", 10, 10)});
        Item[] items = app.items;
        items[0].name = "bad apple";
        // Unfortunately, we cannot prevent this manipulation
        assertEquals("bad apple", app.items[0].name);;
        app.updateQuality();
        // But the change is only "temporary"...
        assertEquals("apple", app.items[0].name);;
        app.items[0].name = "bad apple";
        app.addItem(new Item("pear", 5, 5));
        assertEquals("apple", app.items[0].name);;
        app.items[0].name = "bad apple";
        app.removeItem(1);
    }

}
