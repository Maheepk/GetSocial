//
//  GSNetworkManager.h
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#define StringFormat(fmt, ...) [NSString stringWithFormat: fmt, ## __VA_ARGS__]

typedef void(^successCallback)(NSURLSessionDataTask *operation, id responseObject);
typedef void(^failureCallback)(NSURLSessionDataTask *operation, NSError *error);

@interface GSNetworkManager : AFHTTPSessionManager

+ (GSNetworkManager *)sharedManager;

@end
