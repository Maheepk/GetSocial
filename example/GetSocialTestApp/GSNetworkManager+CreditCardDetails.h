//
//  GSNetworkManager+CreditCardDetails.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 14/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "GSNetworkManager.h"
#import "CreditCardDetails.h"
@interface GSNetworkManager (CreditCardDetails)
+ (NSURLSessionDataTask *)createCreditCardDetails:(CreditCardDetails *)creditCardDetails  success:(successCallback)success failure:(failureCallback)failure;
+ (NSURLSessionDataTask *)createPaymentWithAccountId:(NSString *) ID andAmount:(NSString *) amount  success:(successCallback)success failure:(failureCallback)failure;
+ (NSURLSessionDataTask *)GetUserDetailsWithUserID:(NSString *) ID success:(successCallback)success failure:(failureCallback)failure;
@end
