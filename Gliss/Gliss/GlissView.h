//
//  GlissView.h
//  Gliss
//
//  Created by zqn on 16/3/9.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GlissView : NSOpenGLView
{
    IBOutlet NSMatrix *sliderMatrix;
    float lightX, theta, radius;
    int displayList;
}
-(IBAction)changeParameter:(id)sender;
@end
