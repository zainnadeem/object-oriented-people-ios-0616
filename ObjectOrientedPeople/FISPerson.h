//  FISPerson.h

#import <Foundation/Foundation.h>

@interface FISPerson : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSUInteger age;
@property (strong, nonatomic, readonly) NSMutableArray *skills;
@property (nonatomic, readonly) BOOL qualifiedTutor;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name
                         age:(NSUInteger)age;
- (instancetype)initWithName:(NSString *)name
                         age:(NSUInteger)age
                      skills:(NSMutableArray *)skills
              qualifiedTutor:(BOOL)qualifiedTutor;

- (NSString *)celebrateBirthday;

- (void)learnSkillBash;
- (void)learnSkillXcode;
- (void)learnSkillObjectiveC;
- (void)learnSkillObjectOrientedProgramming;
- (void)learnSkillInterfaceBuilder;

- (BOOL)qualifyAsTutor;

@end
