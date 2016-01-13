//
//  GSNetworkManager.m
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager.h"
//#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

//#ifdef DEBUG

NSString *const TABaseURL = @"https://sandbox-app.paysimple.com/";
NSString *const username = @"sbx-area1holdings";
NSString *const password = @"MY4f5CioHVnW";

//#else
////to be changed to production in future
//NSString *const TABaseURL = @"https://api.nudgespot.com/201507";
//NSString *const APIKey = @"681247179aeff2d83d8dd0740a7191e1";
//
//#endif

@implementation GSNetworkManager

+ (instancetype)manager
{
    return [[self alloc] initWithBaseURL:[NSURL URLWithString:TABaseURL]];
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
//        self.responseSerializer = [AFJSONResponseSerializer serializer];
         self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [self.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue: @"application/json" forHTTPHeaderField:@"Accept"];
    }
    
    return self;
}

#pragma mark - Shared Manager
+ (GSNetworkManager *)sharedManager
{
    static GSNetworkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [GSNetworkManager manager];
    });
    
    return _sharedManager;
}

//#pragma mark - Load
//+ (void)load
//{
//#if PRINT_VERBOSE_INFORMATION
//    [AFNetworkActivityLogger sharedLogger].level = AFLoggerLevelDebug;
//    [[AFNetworkActivityLogger sharedLogger] startLogging];
//#endif
//    
//    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
//}

@end