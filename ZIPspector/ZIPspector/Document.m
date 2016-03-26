//
//  Document.m
//  ZIPspector
//
//  Created by zqn on 16/3/24.
//  Copyright © 2016年 my.company. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

-(BOOL)readFromURL:(NSURL *)url ofType:(NSString *)typeName error:(NSError * _Nullable __autoreleasing *)outError
{
    //工作的哪个文件
    NSString *filename = [url path];
    
    //准备任务对象
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/zipinfo"];
    NSArray *args = [NSArray arrayWithObjects:@"-1",filename, nil];
    [task setArguments:args];
    
    //创建读取的管道
    NSPipe *outPipe = [[NSPipe alloc] init];
    [task setStandardOutput:outPipe];
    
    //开始进程
    [task launch];
    
    //读取输出
    NSData *data = [[outPipe fileHandleForReading] readDataToEndOfFile];
    
    //确认任务正常中断
    [task waitUntilExit];
    int status = [task terminationStatus];
    
    //检查状态
    if (status != 0) {
        if (outError) {
            NSDictionary *eDict = [NSDictionary dictionaryWithObject:@"zipinfo failed"
                                                              forKey:NSLocalizedFailureReasonErrorKey];
            *outError = [NSError errorWithDomain:NSOSStatusErrorDomain
                                            code:0
                                        userInfo:eDict];
            return NO;
        }
    }
    
    //字符串转换
    NSString *aString = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
    
    //字符串到行
    filenames = [aString componentsSeparatedByString:@"\n"];
    NSLog(@"filenames=%@",filenames);
    
    //处理翻转
    [tableView reloadData];
    
    return YES;
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [filenames count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [filenames objectAtIndex:row];
}

@end
