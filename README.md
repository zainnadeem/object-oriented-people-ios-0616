# Object Oriented People

## Objectives

1. Create a new class that contains read-only properties.
2. Write a designated initializer, default initializer, and convenience initializer to set initial values for the properties of an instance of that class.
3. Write public methods that provide controlled interaction with the read-only properties.
 
## Instructions

Open the `object-oriented-people.xcworkspace` file. 

### I. Create the Class Files

Create a new class called `FISPerson` class that inherits from `NSObject`.

#### Declare the Properties

Publicly declare four properties as `readonly` properties:

  * an `NSString` called `name`,
  * an `NSUInteger` called `ageInYears`,
  * an `NSUInteger` called `heightInInches`, and
  * an `NSMutableArray` called `skills`.

**Top-tip:** *Remember that primitive-type properties cannot accept a retention attribute (*`strong` *or* `weak`*).*

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
  * `initWithName:ageInYears:` — a convenience initializer,
  * `initWithName:ageInYears:heightInInches:` — a designated initializer,

  * `celebrateBirthday` which returns an `NSString`,

  * `learnSkillBash` which returns `void`,
  * `learnSkillXcode` which returns `void`,
  * `learnSkillObjectiveC` which returns `void`,
  * `learnSkillObjectOrientedProgramming` which returns `void`,
  * `learnSkillInterfaceBuilder` which returns `void`, and

  * `isQualifiedTutor` which returns a `BOOL`.

#### Define Initial Methods Implementations

Move to the `.m` implementation file. Utilizing autocomplete to quickly fill in the method name, initially define the methods to:

For the initializers, `init`, `initWithName:ageInYears:`, and `initWithName:ageInYears:heightInInches`:

```objc
self = [super init];
return self;
```
For the `celebrateBirthday` method:

```objc
return nil;
```
For the five `learnSkill...` methods, provide no implementation.

For the `isQualifiedTutor` method:

```objc
return NO;
```
Run the tests with `⌘` `U`. The build should succeed but the tests should fail. Throughout solving the rest of this lab, run the tests frequently to check your work as you write it.

### II. Implement the Initializers

1 — Write the implementation for the designated initializer `initWithName:ageInYears:heightInInches:`. Remember to follow the designated initializer format that: 

  * assigns to `self` a call of `[super init]`,
  * checks `if (self) {...}`,
  * sets the three properties' instance variables to the associated argument passed into the initializer,
  * sets the `skills` array to an empty `NSMutableArray`, and
  * returns `self`:

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

2 — Override the default initializer `init` so that it calls the designated initializer with default arguments that are representations of your own name (i.e. `@"Mark"`) age (i.e. `29`) and height (i.e. `71`)—now you can brag about being a (data) model! Remember that this method should:

  * assign to `self` a call of the designated initializer upon `self`, passing in the desired default values as arguments, and
  * return `self`:

```objc
// default initializer
- (instancetype)init {
    self = [self initWith...]; // calls designated initializer
    return self;
}
```

**Top-tip:** *The* `NSMutableArray` *ivar should be initialized to an empty* `NSMutableArray` *using* `[[NSMutableArray alloc] init];`

3 — Write the implementation for the convenience initializer `initWithName:ageInYears:`. Remember that this method should:

  * assign to `self` a call of the designated initializer upon `self`, passing in the arguments for `name` and `ageInYears` directly into the designated initializer, and passing in a default value for `heightInInches` that is reasonable (i.e. `67`), and
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

  * increment the `ageInYears` property by one:
  * capture the return of calling `ordinalForInteger:` with the `self.ageInYears` property submitted as the argument:
  * use the `stringWithFormat:` class method on `NSString` to create a formatted string that will read `HAPPY 30TH BIRTHDAY, MARK!!!` when an instance of `FISPerson` with the `name` property set to `@"Mark"` and the `ageInYears` property set to `29` performs the `celebrateBirthday` method; capture this formatted string into a new string object.
  * use an `NSLog()` to print the birthday message to the console, and
  * finally, `return` the formatted string containing the birthday message so the test can verify it.

### IV. Implement the `learnSkill...` Methods

1 — Write the method implementation for `learnSkillBash` to check whether the `self.skills` array already contains the string `@"bash"`, and if not, to add it.

2 — Write the method implementation for `learnSkillXcode` to check whether the `self.skills` array already contains the string `@"Xcode"`, and if not, to add it. 

3 — Write the method implementation for `learnSkillObjectiveC` to check whether the `self.skills` array already contains the string `@"Objective-C"`, and if not, to add it.

4 — Write the method implementation for `learnSkillObjectOrientedProgramming` to check whether the `self.skills` array already contains the string `@"Object-Oriented Programming"`, and if not, to add it.

5 — Write the method implementation for `learnSkillInterfaceBuilder` to check whether the `self.skills` array already contains the string `@"Interface Builder"`, and if not, to add it.

### V. Implement the `isQualifiedTutor` Method

Write the method implementation for the `isQualifiedTutor` method. It should check whether there are *at least* four elements in the `self.skills` array and:

  * if so, it should return `YES`, but
  * if NOT, it should return `NO`.

**Advanced:** *Ideally this information would be saved in a readonly property with an overridden getter method.*