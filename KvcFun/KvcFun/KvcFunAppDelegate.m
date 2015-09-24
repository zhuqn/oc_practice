//
//  KvcFunAppDelegate.m
//  KvcFun
//
//  Created by zqn on 15/9/24.
//  Copyright © 2015年 my.company. All rights reserved.
//

#import "KvcFunAppDelegate.h"

@interface KvcFunAppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation KvcFunAppDelegate

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        NSLog(@"fido=%@",n);
    }
    return self;
}

//- (int)fido{
//    NSLog(@"-fido is returning% d",fido);
//    return fido;
//}
//
//- (void)setFido:(int)x{
//    NSLog(@"-setFido is called with %d",x);
//    fido = x;
//}

@synthesize fido;

//- (IBAction)incrementFido:(id)sender {
//    [self willChangeValueForKey:@"fido"];
//    fido++;
//    NSLog(@"fido is now %d",fido);
//    [self didChangeValueForKey:@"fido"];
//}

//- (IBAction)incrementFido:(id)sender {
//    
//    [self setFido:[self fido] + 1];
//}

- (IBAction)incrementFido:(id)sender {
    NSNumber *n = [self valueForKey:@"fido"];
    NSNumber *npp = [NSNumber numberWithInt:[n intValue] + 1];
    [self setValue:npp forKey:@"fido"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
