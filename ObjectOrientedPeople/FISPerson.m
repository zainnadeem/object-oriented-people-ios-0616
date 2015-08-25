//  FISPerson.m

#import "FISPerson.h"

@interface FISPerson ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSUInteger age;
@property (strong, nonatomic, readwrite) NSMutableArray *skills;
@property (nonatomic, readwrite) BOOL qualifiedTutor;

@end

@implementation FISPerson

// default initializer
- (instancetype)init {
    self = [self initWithName:@"Mark"
                          age:29
                       skills:[[NSMutableArray alloc] init]
               qualifiedTutor:NO];
    return self;
}

// convenience initializer
- (instancetype)initWithName:(NSString *)name
                         age:(NSUInteger)age {
    self = [self initWithName:name
                          age:age
                       skills:[[NSMutableArray alloc] init]
               qualifiedTutor:NO];
    return self;
}

// designated initializer
- (instancetype)initWithName:(NSString *)name
                         age:(NSUInteger)age
                      skills:(NSMutableArray *)skills
              qualifiedTutor:(BOOL)qualifiedTutor {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _skills = skills;
        _qualifiedTutor = qualifiedTutor;
    }
    return self;
}

- (NSString *)celebrateBirthday {
    self.age++;
    NSString *ordinal = [self ordinalForInteger:self.age];
    
    NSString *message = [NSString stringWithFormat:@"HAPPY %lu%@ BIRTHDAY, %@!!!", self.age, ordinal.uppercaseString, self.name.uppercaseString];
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

- (BOOL)qualifyAsTutor {
    if (self.skills.count >= 4) {
        self.qualifiedTutor = YES;
        return YES;
    } else {
        return NO;
    }
}

@end
