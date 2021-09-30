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

- [x] Separate items in to classes based on update behaviour
    * All inherit from an interim UpdateableItem parent class which inherits from Item
    * Might seem like huge overkill, HOWEVER... I think it will end up _a lot_ simpler as well as more flexible
    * UPDATE: Rethunk this and made items inherit from some modules instead
- [x] Rewrite tests with mocks
- [x] Hopefully still pass
- [x] Refactor
- [ ] Test drive towards adding conjoured items using this new design
- [ ] Update this README
- [ ] Profit?
