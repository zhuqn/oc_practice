//
//  ScheduleFetcher.h
//  RanchForecast
//
//  Created by zqn on 2016/8/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleFetcher : NSObject<NSXMLParserDelegate>{
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
}

- (NSArray *)fetchClassesWithError:(NSError **)outError;

@end
