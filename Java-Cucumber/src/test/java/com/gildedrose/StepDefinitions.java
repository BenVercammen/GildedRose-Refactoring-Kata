package com.gildedrose;

import io.cucumber.java.Before;
import io.cucumber.java.DataTableType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;

public class StepDefinitions {
    private GildedRose app;

    /**
     * Using a comparator instead of adding an equals and hashcode method, out of fear for the goblin in the corner...
     */
    private Comparator<Item> itemComparator = (item1, item2) -> {
        if (item1.name.equals(item2.name) && item1.quality == item2.quality && item1.sellIn == item2.sellIn) {
            return 0;
        }
        // We only want to check exact equality, ordering doesn't matter to us...
        return -1;
    };

    @Before
    public void setUp() {
        app = new GildedRose(new Item[0]);
    }

    @When("I update the quality")
    public void i_update_the_quality() {
        app.updateQuality();
    }

    @Then("I should get item as {string}")
    public void i_should_get_sellin_as_and_quality_as(String expected) {
        assertEquals(expected, app.items[0].name);
    }

    @Given("the following items are in stock")
    public void theFollowingItemsAreInStock(List<Item> items) {
        app.addItems(items.toArray(new Item[0]));
    }

    @Then("the stock should contain the following items")
    public void theStockShouldContainTheFollowingItems(List<Item> items) {
        Item[] actualItems = app.items;
        Item[] expectedItems = items.toArray(new Item[0]);
        StringBuffer msg = new StringBuffer();
        msg.append("\nExpected:\n" + items.stream().map(item -> (item.name + " | " + item.quality + " | " + item.sellIn)).collect(Collectors.joining("\n")));
        msg.append("\nActual:\n" + Arrays.stream(actualItems).map(item -> (item.name + " | " + item.quality + " | " + item.sellIn)).collect(Collectors.joining("\n")));
        msg.append("\n");
        Assert.assertTrue(msg.toString(), Arrays.equals(expectedItems, actualItems, itemComparator));
    }

    @DataTableType
    public Item itemEntry(Map<String, String> entry) {
        String name = entry.get("Name");
        int sellIn = Integer.parseInt(entry.get("Sell in"));
        int quality = Integer.parseInt(entry.get("Quality"));
        return new Item(name, sellIn, quality);
    }
}
