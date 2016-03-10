//
//  GlissView.m
//  Gliss
//
//  Created by zqn on 16/3/9.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "GlissView.h"
#import <OpenGL/OpenGL.h>
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>
//#import <OpenGL/gl3.h>

#define LIGHT_X_TAG 0
#define THETA_TAG 1
#define RADIUS_TAG 2

@implementation GlissView

- (void)drawRect:(NSRect)dirtyRect {
//    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //清除背景
    glClearColor(0.2, 0.4, 0.1, 0.0);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    
    //设置视图点
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(radius * sin(theta), 0, radius*cos(theta), 0, 0, 0, 0, 1, 0);
    
    //在空间中放置光照
    GLfloat lightPosition[] = {lightX,1,3,0,0};
    glLightfv(GL_LIGHT0, GL_POSITION, lightPosition);
    
    if (!displayList) {
        displayList = glGenLists(1);
        glNewList(displayList, GL_COMPILE_AND_EXECUTE);
        //绘制
        glTranslatef(0, 0, 0);
        glutSolidCone(0.3,0.9,35,31);
        glTranslatef(0, 0, 0.6);
        glutSolidTorus(0,3,1.8,35,31);
        
        glEndList();
    }
    else
        glCallList(displayList);
    
    //屏幕操作
    glFinish();
}

-(void)prepare
{
    NSLog(@"prepare");
    
    //GL context 必须处于激活状态，这样才能看到效果
    NSOpenGLContext *glcontext = [self openGLContext];
    [glcontext makeCurrentContext];
    
    //视图配置
    glShadeModel(GL_SMOOTH);
    glEnable(GL_LIGHTING);
    glEnable(GL_DEPTH_TEST);
    
    //添加环境光
    GLfloat ambient[] = {0.2,0.2,0.2,1.0};
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT,ambient);
    
    //初始化光照
    GLfloat diffuse[] = {1.0,1.0,1.0,1.0};
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse);
    //打开光照
    glEnable(GL_LIGHT0);
    
    //在环境光下设置资源property
    GLfloat mat[] = {0.1,0.1,0.7,1.0};
    glMaterialfv(GL_FRONT, GL_AMBIENT, mat);
    
    //在漫反射光下设置资源property
    glMaterialfv(GL_FRONT, GL_DIFFUSE, mat);
}

-(id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}

//在视图尺寸调整时调用
-(void)reshape
{
    NSLog(@"reshaping");
    //切换窗口空间，柴永像素梁刚
    NSRect baseRect = [self convertRectToBase:[self bounds]];
    //结果是glViewport()-compatible
    glViewport(0, 0, baseRect.size.width, baseRect.size.height);
    glMatrixMode(GL_PROJECTION);
    
    glLoadIdentity();
    gluPerspective(60.0, baseRect.size.width/baseRect.size.height, 0.2, 7);
}

-(void)awakeFromNib
{
    [self changeParameter:self];
}

-(IBAction)changeParameter:(id)sender
{
    lightX = [[sliderMatrix cellWithTag:LIGHT_X_TAG] floatValue];
    theta = [[sliderMatrix cellWithTag:THETA_TAG] floatValue];
    radius = [[sliderMatrix cellWithTag:RADIUS_TAG] floatValue];
    [self setNeedsDisplay:YES];
}

@end
