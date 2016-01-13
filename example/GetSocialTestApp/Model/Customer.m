//
//  Customer.m
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "Customer.h"
#import "Address.h"

@implementation Customer

+ (instancetype)customerWithDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
        return nil;
    
    return [[Customer alloc] initWithDictionary:dictionary];
}


- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        
        self.shippingSameAsBilling = [dictionary[@"ShippingSameAsBilling"] boolValue];
        self.firstName = dictionary[@"FirstName"];
        self.lastName = dictionary[@"LastName"];
        self.email = dictionary[@"Email"];
        self.phone = dictionary[@"Phone"];
        self.customerAccount = dictionary[@"CustomerAccount"];
        self.notes = dictionary[@"Notes"];
        self.company = dictionary[@"Company"];
        self.shippingAddress = [Address addressWithDictionary:dictionary[@"ShippingAddress"]];
        self.billingAddress = [Address addressWithDictionary:dictionary[@"BillingAddress"]];
    }
    return self;
}

- (void)setDictionary:(NSMutableDictionary *)dictionary
{
    if (self) {
        
        [dictionary setObject:[NSString stringWithFormat:@"%d",self.shippingSameAsBilling] forKey:@"ShippingSameAsBilling"];
        [dictionary setObject:self.firstName forKey:@"FirstName"];
        [dictionary setObject:self.lastName forKey:@"LastName"];
        [dictionary setObject:self.phone forKey:@"Phone"];
        [dictionary setObject:self.customerAccount forKey:@"CustomerAccount"];
        [dictionary setObject:self.notes forKey:@"Notes"];
        [dictionary setObject:self.company forKey:@"Company"];
        [dictionary setObject:self.email forKey:@"Email"];
        [dictionary setObject:self.shippingAddress.dictionary forKey:@"ShippingAddress"];
        [dictionary setObject:self.billingAddress.dictionary forKey:@"BillingAddress"];
    }
}

@end
