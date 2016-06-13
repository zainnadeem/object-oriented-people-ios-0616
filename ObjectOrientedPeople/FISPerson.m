//

//  FISPerson.m

//  ObjectOrientedPeople

//

//  Created by Zain Nadeem on 6/13/16.

//  Copyright © 2016 al-tyus.com. All rights reserved.

//



#import "FISPerson.h"



@interface FISPerson ()

@property (strong, nonatomic,) NSString *name;

@property (nonatomic) NSUInteger ageInYears;

@property (nonatomic) NSUInteger heightInInches;

@property (strong, nonatomic) NSMutableArray *skills;

@property (nonatomic) BOOL isQualifiedTutor;



@end





@implementation FISPerson



-(instancetype)init{
    
    self = [self initWithName:@"ZAIN" ageInYears:27 heightInInches:510];
    
    
    
    return self;
    
}

-(instancetype)initWithName:(NSString*)name ageInYears:(NSUInteger)ageInYears{
    
    self = [self initWithName:name ageInYears:ageInYears heightInInches:65];
    
    return self;
    
}

-(instancetype)initWithName:(NSString*)name ageInYears:(NSUInteger)ageInyears heightInInches:(NSUInteger)heightInInches{
    
    self = [super init];
    
    if (self) {
        
        _name = name;
        
        _ageInYears = ageInyears;
        
        _heightInInches = heightInInches;
        
        _skills = [[NSMutableArray alloc]initWithArray:@[]];
        
    }
    
    return self;
    
}



-(NSString*)celebrateBirthday{
    
    NSString *celebrateBirthday;
    
    self.ageInYears ++;
    
    NSString *dateEnding =  [self ordinalForInteger:self.ageInYears];
    
    celebrateBirthday = [NSString stringWithFormat: @"HAPPY %lu%@ BIRTHDAY, %@!!!", self.ageInYears, [dateEnding uppercaseString], [self.name uppercaseString]];
    
    NSLog(@"%@***********************************", celebrateBirthday);
    
    
    
    return celebrateBirthday;
    
}

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





-(void)learnSkillBash{
    
    if (!([self.skills containsObject:@"bash"])) {
        
        [self.skills addObject:@"bash"];
        
    }
    
}

-(void)learnSkillXcode{
    
    if (!([self.skills containsObject:@"Xcode"])) {
        
        [self.skills addObject:@"Xcode"];
        
    }
    
}

-(void)learnSkillObjectiveC{
    
    if (!([self.skills containsObject:@"Objective-C"])) {
        
        [self.skills addObject:@"Objective-C"];
        
    }
    
}

-(void)learnSkillObjectOrientedProgramming{
    
    if (!([self.skills containsObject:@"Object-Oriented Programming"])) {
        
        [self.skills addObject:@"Object-Oriented Programming"];
        
    }
    
}

-(void)learnSkillInterfaceBuilder{
    
    if (!([self.skills containsObject:@"Interface Builder"])) {
        
        [self.skills addObject:@"Interface Builder"];
        
    }
    
}

-(BOOL)isQualifiedTutor{
    
    if (self.skills.count >= 4){
        
        _isQualifiedTutor = true;
        
    }else{
        
        _isQualifiedTutor = false;
        
    }
    
    return _isQualifiedTutor;
    
}



@end

