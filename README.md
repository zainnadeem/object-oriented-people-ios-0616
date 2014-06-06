---
tags: OOP, properties, methods
language: objc
---

## Learning Goals
  1. Learn how Objects work
  2. Get better with Objective-C

## Requirements
  1. Create a new Person Class.  Person should be an NSObject subclass.  
  2. Add all of the required properties to the Person class 
  3. Implement all of the required methods in the Person class 

### Person

#### About Properties
Properties provide a way to create instance variables and accessor methods (getters and setters) in a single step.  Say for instance we created a class called cats.  If Cats has a property (of type NSNumber) numberOfLegs, the cat class will automatically, behind the scenes generate two methods for us: 

```objc 

 - (NSNumber *)numberOfLegs; // getter
 - (void)setNumberOfLegs:(NSNumber *)numberOfLegs; // setter

```

We can use these methods to both set and get our class's properties.  Let's say we create a Cat 'myCat' in our AppDelegates' didFinishLaunchingWithOptions method.  We can set the cats number of legs and get the cats number of legs using the following code.  

```objc

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   [myCat setNumberOfLegs:@4]; //sets number of legs 
   NSNumber *numLegs = [myCat numberOfLegs]; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }

```

But it gets better! Objective-C allows us to use dot notation to both get and set properties.  I could (and in fact should), write the above code like this: 

```objc
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   myCat.numberOfLegs = @4; //sets number of legs 
   NSNumber *numLegs = myCat.numberOfLegs; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }
```

#### Properties 
Create the following properties in Person.h.  

  1. ```(NSNumber *)height```
  2. ```(NSNumber *)age```
  3. ```(NSString *)name```
  4. ```(BOOL) isFemale```
  5. ```(NSMutableArray *)friends```

ex. 
```objc
 @interface Person : NSObject 

 @property (strong, nonatomic) NSNumber *height;
 @property (nonatomic) BOOL isFemale; // notice how primitives are declared a little differently than objects 

 @end
```

#### Methods
  1. ```- (NSNumber *)grow;```
    * Based on age/gender, grow a random amount of inches.
    * If it's a girl with age < 11 grow between 0 and 1 inch, age >= 11 and <=15 grow .5 to 2 inches. >15 grow 0 inches
    * If it's a boy with age < 12 grow between 0 and 1 inch, age >=12 and <=16 grow .5-3.5 inches. >16 grow 0 inches
  2. ```- (void)addFriends:(NSArray *)friends;```
    * Add an array of `Person` friends to this friend
  3. ```- (NSString *)generatePartyList;```
    * Generate a list of friends for an upcoming party.
  4. ```- (BOOL)removeFriend: (Person *)friend;```
    * Remove that friend from the array.
    * Return `YES` or `NO` if they were found
  5. ```- (NSArray *)removeFriends: (NSArray *)friends;```
    * Remove any those friends from the friends list
    * Return an array of friends who were found and removed

#### Testing your Methods 

Let's test our work from the AppDelegate.  

  1. Import the Person class in the AppDelegate's .m 
  2. In didFinishLaunchingWithOptions, instantiate a new Person. ie. ```Person *al = [[Person alloc] init];```  
  3. Set the person's age, height, name, and isFemale properties using dot notation.  ie. ```al.height = @72;``` 
  4. Test each of the required methods and NSLog the output.  ie. ```NSLog(@"%@",[al grow]) // ex output 76;```
  5. Create a few additional Person objects to test addFriends ie. ```[al addFriends:@[jon, chris, sally]]; //assuming i already created jon, chris and sally.  

## Hints 

Here is a simple way to get a random double between 0 and 1

```objc 
 double r = drand48() * 1;
```

Here is a simple way to get a random double between 0 and 10

```objc
 double r = drand48() * 10;
```

Here is a simple way to get a random double between 10 and 20 

```objc
 double r = drand48() * 10 + 10 ;
```

Check out the documentation on NSMutableArray (Help -> Documentation and API Refrences).  NSMutableArray has some great methods ie. addObject, addObjectsFromArray, removeObject, removeObjectsFromArray 

## Extra Credit
  1. Write a method that generates an `ABPerson` for this person.

