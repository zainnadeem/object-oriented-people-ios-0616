//  FISPersonSpec.m


#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISPerson.h"

SpecBegin(FISPerson)

describe(@"FISPerson", ^{
    
    __block FISPerson *joe;
    __block FISPerson *tim;
    __block FISPerson *tom;
    __block FISPerson *jim;
    __block FISPerson *mark;
    __block FISPerson *you;
    
    beforeEach(^{
        
        joe = [[FISPerson alloc] initWithName:@"Joe"
                                   ageInYears:25
                               heightInInches:74      ];
        
        mark = [[FISPerson alloc] initWithName:@"Mark"
                                    ageInYears:29
                                heightInInches:71     ];
        
        
        tim = [[FISPerson alloc] initWithName:@"Tim"
                                   ageInYears:9999    ];
        tom = [[FISPerson alloc] initWithName:@"Tom"
                                   ageInYears:24      ];
        jim = [[FISPerson alloc] initWithName:@"Jim"
                                   ageInYears:30      ];
    
        you = [[FISPerson alloc] init];
    });
        
    describe(@"default initializer", ^{
        it(@"should set all properties to default values", ^{
            expect(you.name).toNot.equal(@"");
            expect(you.ageInYears).toNot.equal(0);
            expect(you.ageInYears).to.beLessThan(120);
            expect(you.skills).to.equal([[NSMutableArray alloc] init]);
        });
    });
    
    describe(@"convenience initializer", ^{
        it(@"should set name and ageInYears to argument values and set heightInInches, skills, to defaults", ^{
            expect(tom.name).to.equal(@"Tom");
            expect(tom.ageInYears).to.equal(24);
            expect(tom.heightInInches).toNot.equal(0);
            expect(tom.skills).to.equal([[NSMutableArray alloc] init]);
            
            expect(jim.name).to.equal(@"Jim");
            expect(jim.ageInYears).to.equal(30);
            expect(jim.heightInInches).toNot.equal(0);
            expect(jim.skills).to.equal([[NSMutableArray alloc] init]);
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set name, ageInYears, and heightInInches to argument values and skills to default", ^{
            expect(joe.name).to.equal(@"Joe");
            expect(joe.ageInYears).to.equal(25);
            expect(joe.heightInInches).to.equal(74);
            expect(joe.skills).to.equal([[NSMutableArray alloc] init]);
            
            expect(mark.name).to.equal(@"Mark");
            expect(mark.ageInYears).to.equal(29);
            expect(mark.heightInInches).to.equal(71);
            expect(mark.skills).to.equal([[NSMutableArray alloc] init]);
        });
    });

    describe(@"celebrateBirthday", ^{
        it(@"should increment the person's age property by one", ^{
            [mark celebrateBirthday];
            expect(mark.ageInYears).to.equal(30);
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
            [tim learnSkillBash];
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
            [tim learnSkillXcode];
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
            [tim learnSkillObjectiveC];
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
            [tim learnSkillObjectOrientedProgramming];
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
            [tim learnSkillInterfaceBuilder];
            NSUInteger skillCount = tim.skills.count;
            [tim learnSkillInterfaceBuilder];
            
            expect(tim.skills.count).to.equal(skillCount);
        });
    });

    describe(@"isQualifiedTutor", ^{
        it(@"should return 'NO' if zero skills are known", ^{
            expect(mark.isQualifiedTutor).to.beFalsy();
        });
        
        it(@"should return 'NO' if only 3 skills are known" , ^{
            [mark learnSkillBash];
            [mark learnSkillXcode];
            [mark learnSkillObjectiveC];
            
            expect(mark.isQualifiedTutor).to.beFalsy();
        });
        
        it(@"should return 'YES' if 4 skills are known" , ^{
            [jim learnSkillBash];
            [jim learnSkillXcode];
            [jim learnSkillObjectiveC];
            [jim learnSkillObjectOrientedProgramming];
            
            expect(jim.isQualifiedTutor).to.beTruthy();
        });
        
        it(@"should return 'YES' if a different 4 skills are known" , ^{
            [tom learnSkillBash];
            [tom learnSkillXcode];
            [tom learnSkillObjectiveC];
            [tom learnSkillInterfaceBuilder];
            
            expect(tom.isQualifiedTutor).to.beTruthy();
        });

        it(@"should return 'YES' if 5 skills are known" , ^{
            [tim learnSkillBash];
            [tim learnSkillXcode];
            [tim learnSkillObjectiveC];
            [tim learnSkillObjectOrientedProgramming];
            [tim learnSkillInterfaceBuilder];

            expect(tim.isQualifiedTutor).to.beTruthy();
        });
    });
});

SpecEnd
