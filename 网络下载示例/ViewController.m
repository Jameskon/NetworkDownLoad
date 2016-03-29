//
//  ViewController.m
//  网络下载示例
//
//  Created by kai on 16/3/29.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "ViewController.h"
#define URL @"http://192.168.23.5:8080/play.mov"


@interface ViewController ()
- (IBAction)start:(id)sender;

@property (nonatomic,strong) NSMutableData *myData;

@end

@implementation ViewController


- (IBAction)start:(id)sender {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    
//    使用NSURLConnectionDataDelegate代理
    [NSURLConnection connectionWithRequest:request delegate:self];
}

// 接收到服务器响应时调用
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"connection didReceiveResponse");
    
    // 当接收服务器响应时初始化NSMutableData
    self.myData = [NSMutableData data];
    
}

// 接收到服务器数据时调用多次调用
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 拼接数据
    [self.myData appendData:data];
    //
    NSLog(@"connection didReceiveData %ld",data.length);
}


// 数据接收完毕后调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//    设置路径（文件夹）
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
//    存储文件名
    NSString *filePath = [path stringByAppendingPathComponent:@"152ruanjian.mov"];
//    自动存储
    [self.myData writeToFile:filePath atomically:YES];
    
    NSLog(@"connectionDidFinishLoading");
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}


@end
