//  FISPersonSpec.m


#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISPerson.h"

SpecBegin(FISPerson)

describe(@"FISPerson", ^{
    
    __block NSMutableArray *allSkills;
    __block NSMutableArray *marksSkills;
    
    __block FISPerson *joe;
    __block FISPerson *tim;
    __block FISPerson *tom;
    __block FISPerson *jim;
    __block FISPerson *mark;
    __block FISPerson *you;
    
    beforeEach(^{
        allSkills = [ @[ @"bash",
                         @"Xcode",
                         @"Objective-C",
                         @"Object-Oriented Programming",
                         @"Interface Builder" ]
                     mutableCopy ];
        
        marksSkills = [ @[ @"bash",
                           @"Xcode",
                           @"Objective-C" ]
                       mutableCopy ];
        
        joe = [[FISPerson alloc] initWithName:@"Joe"
                                          age:25
                                       skills:allSkills
                               qualifiedTutor:YES       ];
        tim = [[FISPerson alloc] initWithName:@"Tim"
                                          age:9999
                                       skills:allSkills
                               qualifiedTutor:YES       ];
        
        mark = [[FISPerson alloc] initWithName:@"Mark"
                                           age:29
                                        skills:marksSkills
                                qualifiedTutor:NO       ];
        
        tom = [[FISPerson alloc] initWithName:@"Tom"
                                          age:24        ];
        jim = [[FISPerson alloc] initWithName:@"Jim"
                                          age:30        ];
        
        you = [[FISPerson alloc] init];
    });
        
    describe(@"default initializer", ^{
        it(@"should set all properties to default values", ^{
            expect(you.name).toNot.equal(@"");
            expect(you.age).toNot.equal(0);
            expect(you.age).to.beLessThan(120);
            expect(you.skills).to.equal([NSMutableArray new]);
            expect(you.qualifiedTutor).to.beFalsy();
        });
    });
    
    describe(@"convenience initializer", ^{
        it(@"should set name and age to argument values and set skills and instructor to defaults", ^{
            expect(tom.name).to.equal(@"Tom");
            expect(tom.age).to.equal(24);
            expect(tom.skills).to.equal([NSMutableArray new]);
            expect(tom.qualifiedTutor).to.beFalsy();
            
            expect(jim.name).to.equal(@"Jim");
            expect(jim.age).to.equal(30);
            expect(jim.skills).to.equal([NSMutableArray new]);
            expect(jim.qualifiedTutor).to.beFalsy();
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set all properties to argument values", ^{
            expect(joe.name).to.equal(@"Joe");
            expect(joe.age).to.equal(25);
            expect(joe.skills).to.equal(allSkills);
            expect(joe.qualifiedTutor).to.beTruthy();
            
            expect(tim.name).to.equal(@"Tim");
            expect(tim.age).to.equal(9999);
            expect(tim.skills).to.equal(allSkills);
            expect(tim.qualifiedTutor).to.beTruthy();
            
            expect(mark.name).to.equal(@"Mark");
            expect(mark.age).to.equal(29);
            expect(mark.skills).to.equal(marksSkills);
            expect(mark.qualifiedTutor).to.beFalsy();
        });
    });

    describe(@"celebrateBirthday", ^{
        it(@"should increment the person's age property by one", ^{
            [mark celebrateBirthday];
            expect(mark.age).to.equal(30);
        });
        
        it(@"should return a string containing a happy birthday message for Mark", ^{
            NSString *happy30thBirthdayMark = @"HAPPY 30TH BIRTHDAY, MARK!!!";
            expect([mark celebrateBirthday]).to.equal(happy30thBirthdayMark);
        });
        
        it(@"should return a string containing a happy birthday message for Tim", ^{
            NSString *happy10000thBirthdayTim = @"HAPPY 10000TH BIRTHDAY, TIM!!!";
            expect([tim celebrateBirthday]).to.equal(happy10000thBirthdayTim);
        });
    });
    
    describe(@"learnSkillBash", ^{
        it(@"should add 'bash' to skills if unknown", ^{
            [you learnSkillBash];
            expect(you.skills).to.contain(@"bash");
        });
        
        it(@"should NOT add 'bash' to skills if ALREADY known", ^{
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillBash];
            expect(tim.skills.count).to.equal(skillCount);
        });
    });
    
    describe(@"learnSkillXcode", ^{
        it(@"should add 'Xcode' to skills if unknown", ^{
            [you learnSkillXcode];
            expect(you.skills).to.contain(@"Xcode");
        });
        
        it(@"should NOT add 'Xcode' to skills if ALREADY known", ^{
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillXcode];
            expect(tim.skills.count).to.equal(skillCount);
        });
    });
    
    describe(@"learnSkillObjectiveC", ^{
        it(@"should add 'Objective-C' to skills if unknown", ^{
            [you learnSkillObjectiveC];
            expect(you.skills).to.contain(@"Objective-C");
        });
        
        it(@"should NOT add 'Objective-C' to skills if ALREADY known", ^{
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillObjectiveC];
            expect(tim.skills.count).to.equal(skillCount);
        });
    });

    describe(@"learnSkillObjectOrientedProgramming", ^{
        it(@"should add 'Object-Oriented Programming' to skills if unknown", ^{
            [you learnSkillObjectOrientedProgramming];
            expect(you.skills).to.contain(@"Object-Oriented Programming");
        });
        
        it(@"should NOT add 'Object-Oriented Programming' to skills if ALREADY known", ^{
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillObjectOrientedProgramming];
            expect(tim.skills.count).to.equal(skillCount);
        });
    });

    describe(@"learnSkillInterfaceBuilder", ^{
        it(@"should add 'Interface Builder' to skills if unknown", ^{
            [you learnSkillInterfaceBuilder];
            expect(you.skills).to.contain(@"Interface Builder");
        });
        
        it(@"should NOT add 'Interface Builder' to skills if ALREADY known", ^{
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillInterfaceBuilder];
            expect(tim.skills.count).to.equal(skillCount);
        });
    });

    describe(@"qualifyAsTutor", ^{
        it(@"should not change the 'qualifiedTutor' property to 'YES' if less than 4 skills are known", ^{
            [mark qualifyAsTutor];
            expect(mark.qualifiedTutor).to.beFalsy();
            
            [tom qualifyAsTutor];
            expect(tom.qualifiedTutor).to.beFalsy();
        });
        
        it(@"should change the 'qualifiedTutor' property to 'YES' if 4 or more skills are known" , ^{
            [mark learnSkillObjectOrientedProgramming];
            [mark qualifyAsTutor];
            expect(mark.qualifiedTutor).to.beTruthy();
            
            [tom learnSkillBash];
            [tom learnSkillXcode];
            [tom learnSkillObjectiveC];
            [tom learnSkillObjectOrientedProgramming];
            [tom learnSkillInterfaceBuilder];
            [tom qualifyAsTutor];
            expect(tom.qualifiedTutor).to.beTruthy();
        });
        
        it(@"should NOT change the 'qualifiedTutor' property to 'NO' if it is already 'YES'", ^{
            [joe qualifyAsTutor];
            expect(joe.qualifiedTutor).to.beTruthy();
        });
        
        it(@"should return 'YES' if the 'qualifiedTutor' property was changed from 'NO' to 'YES'", ^{
            [mark learnSkillObjectOrientedProgramming];
            BOOL markSuccess = [mark qualifyAsTutor];
            expect(mark.qualifiedTutor).to.beTruthy();
            expect(markSuccess).to.beTruthy();
            
            [tom learnSkillBash];
            [tom learnSkillXcode];
            [tom learnSkillObjectiveC];
            [tom learnSkillObjectOrientedProgramming];
            [tom learnSkillInterfaceBuilder];
            BOOL tomSuccess = [tom qualifyAsTutor];
            expect(tom.qualifiedTutor).to.beTruthy();
            expect(tomSuccess).to.beTruthy();
        });
        
        it(@"should return 'NO' if the 'qualifiedTutor' property is 'NO'" , ^{
            BOOL markSuccess = [mark qualifyAsTutor];
            expect(markSuccess).to.beFalsy();
        });
        
        it(@"should return 'YES' if the 'qualifiedTutor' property is already 'YES'", ^{
            BOOL joeSuccess = [joe qualifyAsTutor];
            expect(joeSuccess).to.beTruthy();
        });
    });
});

SpecEnd
