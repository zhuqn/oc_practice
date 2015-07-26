//
//  BNRItem.m
//  RandomItems
//
//  Created by zqn on 15/7/22.
//  Copyright (c) 2015年 my.company. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
+ (instancetype)randomItem
{
    //创建不可变数组对象，包含三个形容词
    NSArray *randomAdjectiveList = @[@"Fluffy",@"Rusty",@"Shiny"];
    //创建不可变数组对象，包含三个名词
    NSArray *randomNounList = @[@"Bear",@"Spork",@"Mac"];
    
    NSInteger adjectiveIndex = arc4random()%[randomAdjectiveList count];
    NSInteger nounIndex = arc4random()%[randomNounList count];
    
//    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    int randomValue = arc4random()%100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c",
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    '0'+arc4random()%10,
                                    'A'+arc4random()%26,
                                    'A'+arc4random()%10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    //调用父类初始化消息
    self=[super init];
    
    if (self) {
        _itemName=name;
        _serialNumber=sNumber;
        _valueInDollars=value;
        
        //设置_dateCreated的值为当前系统时间
        _dateCreated=[[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

- (void)setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    self.containedItem.container=self;
}

//- (void)setContainedItem:(BNRItem *)item
//{
//    _containedItem=item;
//    
//    item.container=self;
//}
//
//- (BNRItem *)containedItem
//{
//    return _containedItem;
//}
//
//- (void)setContainer:(BNRItem *)item
//{
//    _container=item;
//}
//
//- (BNRItem *)container
//{
//    return _container;
//}
//
//- (void)setItemName:(NSString *)str
//{
//    _itemName=str;
//}
//- (NSString *)itemName
//{
//    return _itemName;
//}
//- (void)setSerialNumber:(NSString *)str
//{
//    _serialNumber=str;
//}
//- (NSString *)serialNumber
//{
//    return _serialNumber;
//}
//- (void)setValueInDollars:(int)v
//{
//    _valueInDollars=v;
//}
//- (int)valueInDollars
//{
//    return _valueInDollars;
//}
//- (NSDate *)dateCreated
//{
//    return _dataCreated;
//}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",self.itemName,self.serialNumber,self.valueInDollars,self.dateCreated];
    return descriptionString;
}

- (void)dealloc
{
    NSLog(@"dealloc %@",self);
}

@end
