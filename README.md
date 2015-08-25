# Object Oriented People

## Objectives

1. Create a new class that contains read-only properties.
2. Write a designated initializer, default initializer, and convenience initializer to set initial values for the properties of an instance of that class.
3. Write public methods that provide a controlled interface with the read-only properties.
 
## Instructions

Fork and clone this lab. 

Open the `object-oriented-people.xcworkspace` file. 

### I. Create the Class Files

Create a new class called `FISPerson` that inherits from `NSObject`.

#### Declare the Properties

Publicly declare four properties as `readonly` properties:

  * An `NSString` property called `name`,
  * An `NSUInteger` property called `age`,
  * An `NSMutableArray` property called `skills`, and
  * A `BOOL` property called `qualifiedTutor`.

**Top-tip:** *Remember that primitive-type properties cannot accept a retention attribute (*`strong`/`retain` *or* `weak`*).*

Insert the private `@interface` section below the `#import` statements of the `.m` implementation file:

```objc
//  FISPerson.m

#import "FISPerson.h"

@interface FISPerson ()

@end

@implementation

@end
```

**Top-tip:** *Don't forget to include the empty parenthesis that conclude the private* `@interface` *section.*

Now privately redeclare all four properties as `readwrite` within the private `@interface` section.

#### Declare the Methods

Publicly declare the ten following methods in the `.h` header file:

  * `init` — the default initializer,
  * `initWithName:age:` — a convenience initializer,
  * `initWithName:age:skills:qualifiedTutor:` — a designated initializer,

  * `celebrateBirthday` which returns an `NSString`,

  * `learnSkillBash` which returns `void`,
  * `learnSkillXcode` which returns `void`,
  * `learnSkillObjectiveC` which returns `void`,
  * `learnSkillObjectOrientedProgramming` which returns `void`,
  * `learnSkillInterfaceBuilder` which returns `void`, and

  * `qualifyAsTutor` which returns a `BOOL`.

#### Define Initial Methods Implementations

Move to the `.m` implementation file. Utilizing autocomplete to quickly fill in the method name, initially define the methods to:

For the initializers, `init`, `initWithName:age:`, and `initWithName:age:skills:qualifiedTutor:`:

```objc
self = [super init];
return self;
```
For the `celebrateBirthday` and `qualifyAsTutor` methods:

```objc
return nil;
```
For the five `learnSkill...` methods, provide no implementation.

Run the tests with `⌘` `U`. The build should succeed but the tests should fail. Throughout solving the rest of this lab, run the tests frequency to check your work as you compose it.

### II. Implement the Initializers

1 — Write the implementation for the designated initializer `initWithName:age:skills:qualifiedTutor:`. Remember to follow the designated initializer format that 

  * assigns to `self` a call of `[super init]`,
  * checks `if (self) {...}`,
  * sets each of the four properties' instance variables to the associated argument passed into the initializer, and
  * return `self`:

```objc
// designated initializer
- (instanceType)initWith... {
    self = [super init];
    if (self) {
        //    ivar        argument
        _propertyName = propertyName;
    }
    return self;
}
```

2 — Override the default initializer `init`. Remember that this method should:

  * assign to `self` a call of the designated initializer upon `self`, passing in default values to each of the designated initializer's arguments, and
  * return `self`:

```objc
// default initializer
- (instancetype)init {
    self = [self initWith...]; // calls designated initializer
    return self;
}
```

**Top-tip:** *The* `NSMutableArray` *ivar should be initialized to an empty* `NSMutableArray` *using* `[[NSMutableArray alloc] init];

3 — Write the implementation for the convenience initializer `initWithName:age:`. Remember that this method should:

  * assign to `self` a call of the designated initializer upon `self`, passing in the arguments for `name` and `age` directly into the designated initializer, and passing in default values for `skills` and `qualifiedTutor` into the designated initializer, and
  * return `self`.

```objc
// convenience initializer
-(instancetype)initWith... {
    self = [self initWith...]; // calls designated initializer
    return self;
}
```

### III. Implement the `celebrateBirthday` Method

1 — Copy the following (private) helper method `ordinalForInteger:` into the `.m` implementation file immediately below the empty implementation for `celebrateBirthday`. This method returns a string containing the correct ordinal for the `NSUInteger` submitted as the `integer` argument:

```objc
// helper method
- (NSString *)ordinalForInteger:(NSUInteger)integer {
    NSString *ordinal = @"th";
    if (integer % 10 == 1 && integer % 100 != 11) {
        ordinal = @"st";
    } else if (integer % 10 == 2 && integer % 100 != 12) {
        ordinal = @"nd";
    } else if (integer % 10 == 3 && integer % 100 != 13) {
        ordinal = @"rd";
    }
    return ordinal;
}
```

2 — Write the method implementation for `celebrateBirthday` to:

  * increment the `age` property by one:
    * `self.age++;`
  * capture the return of calling `ordinalForInteger:` with the `self.age` property submitted as the argument:
    * `NSString *ordinal = [self ordinalForInteger:self.age];`
  * use the `stringWithFormat:` class method on `NSString` to create a formatted string that will read `HAPPY 30TH BIRTHDAY, MARK!!!` when an instance of `FISPerson` with the `name` property set to `@"Mark"` and the `age` property set to `29` performs the `celebrateBirthday` method; capture this formatted string into a new string object.
  * use `NSLog()` to print the birthday message to the console, and
  * finally, `return` the formatted string containing the birthday message so the test can verify it.

### IV. Implement the `learnSkill...` Methods

**Note:** *The strings in these method must be entered exactly in order for the tests to pass. Pay attention to capitalization and hyphenation.*

1 — Write the method implementation for `learnSkillBash` to check whether the `self.skills` array already contains the string `@"bash"`, and if not, to add it.

2 — Write the method implementation for `learnSkillXcode` to check whether the `self.skills` array already contains the string `@"Xcode"`, and if not, to add it. 

3 — Write the method implementation for `learnSkillObjectiveC` to check whether the `self.skills` array already contains the string `@"Objective-C"`, and if not, to add it.

4 — Write the method implementation for `learnSkillObjectOrientedProgramming` to check whether the `self.skills` array already contains the string `@"Object-Oriented Programming"`, and if not, to add it.

5 — Write the method implementation for `learnSkillInterfaceBuilder` to check whether the `self.skills` array already contains the string `@"Interface Builder"`, and if not, to add it.

### V. Implement the `qualifyAsTutor` Method

Write the method implementation for the `qualifyAsTutor` method. It should check whether there are *at least* four elements in the `self.skills` array.

  * if so, it should toggle the `qualifiedTutor` property to `YES` *and* return `YES`,
  * if NOT, it should make no change to the `qualifiedTutor` property and return `NO`.
