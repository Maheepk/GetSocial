//
//  GSNetworkManager+customer.m
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager+customer.h"
#import "Customer.h"

@implementation GSNetworkManager (customer)

+ (NSURLSessionDataTask *)createCustomer:(Customer *)customer  success:(successCallback)success failure:(failureCallback)failure;
{
    return [[self sharedManager] POST:@"/v4/customer" parameters:customer.dictionary progress:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)getAllCustomersWithSuccess:(successCallback)success failure:(failureCallback)failure;
{
    return [[self sharedManager] GET:@"/v4/customer" parameters:nil progress:nil success:success failure:failure];
}

@end
