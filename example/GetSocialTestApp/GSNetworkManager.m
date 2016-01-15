//
//  GSNetworkManager.m
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager.h"
//#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import <CommonCrypto/CommonHMAC.h>
//#ifdef DEBUG

NSString *const TABaseURL = @"https://sandbox‐api.paysimple.com";
NSString *const username = @"sbx-area1holdings";
NSString *const password = @"8405thAve";
NSString *const APIKey = @"XQyqG5TdzWwG2RHrQsyGRgtL6CLnga0O2HDNodCxXgqCdrk2GAtgwPNTZUu6g5hFpY4wFGB1e6aqJnENvgV1DnbA4rGYD6WkoC7hnA0JnNKOHcrj13gjph4M2kLRKkr0";
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
        
        NSString *authValue = [self creatingSignatureForTheAPI];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
       //  self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        NSLog(@"%@",authValue);
        
        
       //  [self.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue: @"application/json" forHTTPHeaderField:@"Accept"];
       [self.requestSerializer setValue:authValue forHTTPHeaderField:@"Authorization"];
    
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


-(NSString *) creatingSignatureForTheAPI
{
    typedef double NSTimeInterval;
    NSTimeInterval timeStamp1 = [[NSDate date] timeIntervalSince1970];
    // NSTimeInterval is defined as double
    double acd = (double)timeStamp1;
    
    NSDateFormatter *dateFormatter;
    dateFormatter = [[NSDateFormatter alloc] init];
    
    //@"yyyy-MM-dd'T'HH:mm:ss'Z'" - doesn't work
    //@"yyyy-MM-dd'T'HH:mm:ssZZZ" - doesn't work
    //@"yyyy-MM-dd'T'HH:mm:sss" - doesn't work
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    NSString * tS = [dateFormatter stringFromDate:[NSDate date]];
    
    NSNumber *timeStampObj = [NSNumber numberWithDouble: acd];
   // NSString * timeStamp =  [NSString stringWithFormat:@"%f",acd];
    NSLog(@"%@",[timeStampObj stringValue]);
    
    const char *cKey  = [tS cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [APIKey cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac (kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSMutableString *hmac = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hmac appendFormat:@"%02x", cHMAC[i]];
    }
    
    NSString *authStr = [NSString stringWithFormat:@"%@", hmac];

    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"PSSERVERaccessid=%@;timestamp=%@;signature=%@",APIKey,tS, [authData base64EncodedStringWithOptions:0]];
        NSLog(@"%@",authValue);
    return authValue;


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