//
//  CreditCardDetails.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 14/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreditCardDetails : NSObject
@property (nonatomic, strong) NSString *CreditCardNumber;
@property (nonatomic, strong) NSString *ExpirationDate;
@property (nonatomic, strong) NSString *Issuer;
@property (nonatomic, strong) NSString *BillingZipCode;
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, strong) NSString *CustomerId;
@property (nonatomic, assign) NSString *LastModified ;
@property (nonatomic, assign) NSString * CreatedOn;
@property (nonatomic, strong) NSString *IsDefault;
@property (nonatomic, strong)NSMutableDictionary *dictionary;

+ (instancetype)CardDetailsWithDictionary:(NSDictionary *)dictionary;
@end
