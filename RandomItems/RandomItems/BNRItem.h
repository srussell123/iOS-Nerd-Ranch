//
//  BNRItem.h
//  RandomItems
//
//  Created by Scott Russell on 6/1/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong) BNRItem *containedItem;  //strong pointer is default but usually declared
@property (nonatomic, weak) BNRItem *container;     //weak to avoid strong reference cycle and consequent memory leak
@property (nonatomic, copy) NSString *itemName;     //copy used for mutable subclasses
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;  //readonly == no setter for this property

+ (instancetype)randomItem;

- (instancetype)initWithItemName: (NSString *)name
                  valueInDollars: (int)value
                    serialNumber: (NSString *)sNumber;

- (instancetype)initWithItemName: (NSString *)name;

@end
