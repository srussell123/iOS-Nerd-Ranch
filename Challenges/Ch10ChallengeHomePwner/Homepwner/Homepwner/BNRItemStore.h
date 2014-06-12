//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Scott Russell on 6/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

//Notice that this is a class method and prefixed with + instead of -
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem: (BNRItem *)item;
- (void)moveItemAtIndex: (NSUInteger)fromIndex
                toIndex: (NSUInteger)toIndex;

@end
