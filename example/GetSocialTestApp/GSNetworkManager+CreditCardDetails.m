//
//  GSNetworkManager+CreditCardDetails.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 14/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager+CreditCardDetails.h"

@implementation GSNetworkManager (CreditCardDetails)
+ (NSURLSessionDataTask *)createCreditCardDetails:(CreditCardDetails *)creditCardDetails  success:(successCallback)success failure:(failureCallback)failure
{
    
    return [[self sharedManager] POST:@"/v4/account/creditcard" parameters:creditCardDetails.dictionary progress:nil success:success failure:failure];
    
}

+ (NSURLSessionDataTask *)createPaymentWithAccountId:(NSString *) ID andAmount:(NSString *) amount  success:(successCallback)success failure:(failureCallback)failure
{
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:ID,@"AccountId",amount,@"Amount", nil];
    
    return [[self sharedManager] POST:@"/v4/payment" parameters:dict progress:nil success:success failure:failure];
    
    
    
}

+ (NSURLSessionDataTask *)GetUserDetailsWithUserID:(NSString *) ID success:(successCallback)success failure:(failureCallback)failure
{
    
    
    return [[self sharedManager] GET:[NSString stringWithFormat:@"/v4/customer/%@/defaultcreditcard",ID] parameters:nil progress:nil success:success failure:failure];
    
    
    
}
@end
