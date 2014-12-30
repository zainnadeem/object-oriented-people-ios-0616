//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Al Tyus on 6/6/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _height = @9;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@""];
}

-(void)grow
{
    if (self.isFemale)
    {
        if ([self.age integerValue] < 11)
        {
            self.height = @([self.height floatValue] + [self randomFloatBetweenNumber:0 andNumber:1]);
        }
        else if ([self.age integerValue] >= 11 && [self.age integerValue] <=15)
        {
            self.height = @([self.height floatValue] + [self randomFloatBetweenNumber:.5 andNumber:2]);
        }
    }
    else
    {
        if ([self.age integerValue] < 12)
        {
            self.height = @([self.height floatValue] + [self randomFloatBetweenNumber:0 andNumber:1]);
        }
        else if ([self.age integerValue] >=12 && [self.age integerValue] <= 16)
        {
            self.height = @([self.height floatValue] + [self randomFloatBetweenNumber:.5 andNumber:3.5]);
        }
    }

}

#define ARC4RANDOM_MAX 0x100000000
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX)
    * (maxRange - minRange)
    + minRange;
}

- (void)addFriends:(NSArray *)friends;
{
    [self.friends addObjectsFromArray:friends];
}

- (NSString *)generatePartyList;
{
    NSMutableArray *names = [NSMutableArray new];
    for (Person *friend in self.friends)
    {
        if (friend.name)
        {
            [names addObject:friend.name];
        }
    }
    return [names componentsJoinedByString:@", "];
}

- (BOOL)removeFriend:(Person *)friend;
{
    if ([self.friends containsObject:friend])
    {
        [self.friends removeObject:friend];
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSArray *)removeFriends:(NSArray *)friends;
{
    NSMutableArray *removedFriends = [NSMutableArray new];
    for (Person *friend in friends)
    {
        if ([self removeFriend:friend])
        {
            [removedFriends addObject:friend];
        }
    }
    return removedFriends;
}

@end
