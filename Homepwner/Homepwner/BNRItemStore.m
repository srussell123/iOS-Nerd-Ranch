//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Scott Russell on 6/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore;
    
    //Do I need to create a store?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

//If init is called let programmer know it isn't good!
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use + [BNRItemStore sharedStore"];
    return nil;
}

//Real method
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    NSString *key = item.itemKey;
    
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item]; //similar to removeObject but no isEqual, better
    
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    //Get pointer to object being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    //Remove from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    //Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}




@end
