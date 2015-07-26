//
//  BNRItem.h
//  RandomItems
//
//  Created by zqn on 15/7/22.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dataCreated;
//    
//    BNRItem *_containedItem;
//    __weak BNRItem *_container;
//}

@property (nonatomic,strong)BNRItem *containedItem;
@property (nonatomic,weak)BNRItem *container;

@property (nonatomic,copy) NSString *itemName;
@property (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,readonly,strong) NSDate *dateCreated;

+ (instancetype)randomItem;
///BNRItem类的制定初始化方法
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

//- (void)setContainedItem:(BNRItem *)item;
//- (BNRItem *)containedItem;
//
//- (void)setContainer:(BNRItem *)item;
//- (BNRItem *)container;
//
//- (void)setItemName:(NSString *)str;
//- (NSString *)itemName;
//
//- (void)setSerialNumber:(NSString *)str;
//- (NSString *)serialNumber;
//
//- (void)setValueInDollars:(int)v;
//- (int)valueInDollars;
//
//- (NSDate *)dateCreated;

@end
