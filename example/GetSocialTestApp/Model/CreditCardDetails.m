//
//  CreditCardDetails.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 14/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "CreditCardDetails.h"

@implementation CreditCardDetails
+ (id)CardDetailsWithDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
        return nil;
    
    return [[CreditCardDetails alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        self.CreditCardNumber = dictionary[@"CreditCardNumber"];
        self.ExpirationDate = dictionary[@"ExpirationDate"];
        self.Issuer = dictionary[@"Issuer"];
        self.BillingZipCode = dictionary[@"BillingZipCode"];
        self.LastModified = dictionary[@"LastModified"];
        self.CreatedOn = dictionary[@"CreatedOn"];
        
        self.Id = [dictionary[@"Id"] integerValue];
        self.IsDefault = dictionary[@"IsDefault"];
    }
    
    return self;
}

- (void)setDictionary:(NSMutableDictionary *)dictionary
{
    if (self) {
        
        [dictionary setObject:self.CreditCardNumber forKey:@"CreditCardNumber"];
        [dictionary setObject:self.ExpirationDate  forKey:@"ExpirationDate"];
        [dictionary setObject:self.Issuer  forKey:@"Issuer"];
        [dictionary setObject:self.BillingZipCode forKey:@"BillingZipCode"];
        [dictionary setObject:[NSString stringWithFormat:@"%ld",(long)self.Id] forKey:@"Id"];
        [dictionary setObject:self.LastModified forKey:@"LastModified"];
        
        [dictionary setObject:self.CreatedOn forKey:@"CreatedOn"];
        [dictionary setObject:self.IsDefault  forKey:@"IsDefault"];
    }
}

@end
