//  FISPerson.m

#import "FISPerson.h"

@interface FISPerson ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSUInteger ageInYears;
@property (nonatomic, readwrite) NSUInteger heightInInches;
@property (strong, nonatomic, readwrite) NSMutableArray *skills;

@end

@implementation FISPerson

// default initializer
- (instancetype)init {
    self = [self initWithName:@"Mark"
                   ageInYears:29
               heightInInches:71 ];
    return self;
}

// convenience initializer
- (instancetype)initWithName:(NSString *)name
                  ageInYears:(NSUInteger)ageInYears {
    self = [self initWithName:name
                   ageInYears:ageInYears
               heightInInches:67 ];
    return self;
}

// designated initializer
- (instancetype)initWithName:(NSString *)name
                  ageInYears:(NSUInteger)ageInYears
              heightInInches:(NSUInteger)heightInInches {
    self = [super init];
    if (self) {
        _name = name;
        _ageInYears = ageInYears;
        _heightInInches = heightInInches;
        _skills = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)celebrateBirthday {
    self.ageInYears++;
    NSString *ordinal = [self ordinalForInteger:self.ageInYears];
    
    NSString *message = [NSString stringWithFormat:@"HAPPY %lu%@ BIRTHDAY, %@!!!", self.ageInYears, ordinal.uppercaseString, self.name.uppercaseString];
    NSLog(@"%@", message);
    
    return message;
}

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

- (void)learnSkillBash {
    NSString *skill = @"bash";
    
    if (![self.skills containsObject:skill]) {
        [self.skills addObject:skill];
    }
}

- (void)learnSkillXcode {
    NSString *skill = @"Xcode";
    
    if (![self.skills containsObject:skill]) {
        [self.skills addObject:skill];
    }
}

- (void)learnSkillObjectiveC {
    NSString *skill = @"Objective-C";
    
    if (![self.skills containsObject:skill]) {
        [self.skills addObject:skill];
    }
}

- (void)learnSkillObjectOrientedProgramming {
    NSString *skill = @"Object-Oriented Programming";
    
    if (![self.skills containsObject:skill]) {
        [self.skills addObject:skill];
    }
}

- (void)learnSkillInterfaceBuilder {
    NSString *skill = @"Interface Builder";
    
    if (![self.skills containsObject:skill]) {
        [self.skills addObject:skill];
    }
}

- (BOOL)isQualifiedTutor {
    if (self.skills.count >= 4) {
        return YES;
    } else {
        return NO;
    }
}

@end
