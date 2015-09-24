//
//  Person.h
//  RaiseMan
//
//  Created by zqn on 15/9/24.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *personName;
    float expectedRaise;
}
@property (readwrite, copy)NSString *personName;
@property (readwrite)float expectedRaise;

@end
