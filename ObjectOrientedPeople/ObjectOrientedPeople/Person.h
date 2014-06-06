//
//  Person.h
//  ObjectOrientedPeople
//
//  Created by Al Tyus on 6/6/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSNumber *height;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *age;
@property (nonatomic) BOOL isFemale;
@property (nonatomic) NSMutableArray *friends; 

- (NSNumber *)grow;
- (void)addFriends:(NSArray *)friends;
- (NSString *)generatePartyList; 
- (BOOL)removeFriend:(Person *)friend;
- (NSArray *)removeFriends:(NSArray *)friends; 
@end
