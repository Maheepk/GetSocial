//
//  GSNetworkManager+customer.h
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager.h"

@class Customer;

@interface GSNetworkManager (customer)

+ (NSURLSessionDataTask *)createCustomer:(Customer *)customer  success:(successCallback)success failure:(failureCallback)failure;
+ (NSURLSessionDataTask *)getAllCustomersWithSuccess:(successCallback)success failure:(failureCallback)failure;

@end
