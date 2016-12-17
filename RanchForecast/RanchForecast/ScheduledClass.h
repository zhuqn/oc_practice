//
//  ScheduledClass.h
//  RanchForecast
//
//  Created by zqn on 2016/8/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduledClass : NSObject{
    NSString *name;
    NSString *location;
    NSString *href;
    NSDate *begin;
}
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *location;
@property(nonatomic,copy)NSString *href;
@property(nonatomic,copy)NSDate *begin;

@end
