## Gilded Rose Tech Test
## Makers Week 10

### Specification

Update the existing app according to the criteria found in
GildedRoseRequirements.txt

### Initial Plan

- [x] Write new tests for different item types
- [x] Refactor without adding functionality while keeping these tests passing
- [x] Have a little think about what to do then haha

### Phase 2!

- [x] Test drive redesign
- [x] Rewrite tests with mocks
- [x] Hopefully still pass
- [x] Refactor
- [x] Test drive towards adding conjoured items using this new design
- [x] Update this README
- [x] Profit?

## Final implementation

I proceeded more or less as above, with about a thousand extra refactoring steps.

Finally, I ended up with a design with two extra modules: `Updateable` and `Categorizable`, which each item in the `@items` array of a new `GildedRose` class is extended by.

* `Categorizable` gives a `@category` to each item
* `Updateable` allows that item to `update` itelf, according to the rules for its category.
* The categories for each item are in a hash in `Categorizable`
* The update rules are in a case statement in `Updateable`

I think this is semi-elegant, but if it seems a bit over the top it's because I took the requirement not to touch the Item class very seriously, and given that I couldn't adjust its code, extending its functionality at runtime seemed like the next best thing that was also flexible (rather than, e.g. a bunch of `perform_specific_action if item.name == 'specific string'` conditionals in the `update_quality` method). 

Similarly, although I could definitely have made it simpler by creating an `add_item` method for the GuildedRose class which handled setting the rules, and then designing things differently based on that, I understood the challenge as being to sort out the underlying code and allow a new item category to be added _without_ changing the way it already works, which I took to include the way that the `GildedRose` class is created, taking an array of existing items... I'd like to mess around with that more though, if my interpretation is wrong!

### Code Quality

* Methods are short - the longest things are case statements
* Lines are short
* Methods are pruned to only those needed (I think)
* Adding a new type of item requires making a change in *2* places, but it's easy and I think it makes sense since you're doing two different things (i.e., assigning an item to a category in one place, defining update rules for that category in another)
* I think it's readable
* Magic numbers are removed to the best of my abilities
* It's very well tested!
  * All interactions between classes / modules are mocked in the Unit tests
  * I very strictly "test drove" this one
  * Test names are readable and descriptive
* Fully linted
* 100% coverage according to simplecov
