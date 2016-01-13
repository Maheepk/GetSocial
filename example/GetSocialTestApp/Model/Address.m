//
//  BillingAddress.m
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "Address.h"

@implementation Address

+ (id)addressWithDictionary:(NSDictionary *)dictionary
{
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]])
        return nil;
    
    return [[Address alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        self.streetAddress1 = dictionary[@"StreetAddress1"];
        self.streetAddress2 = dictionary[@"StreetAddress2"];
        self.city = dictionary[@"City"];
        self.stateCode = dictionary[@"StateCode"];
        self.zipCode = [dictionary[@"ZipCode"] integerValue];
        self.country = dictionary[@"Country"];
    }
    
    return self;
}

- (void)setDictionary:(NSMutableDictionary *)dictionary
{
    if (self) {
        
        [dictionary setObject:self.streetAddress1 forKey:@"StreetAddress1"];
        [dictionary setObject:self.streetAddress2  forKey:@"StreetAddress2"];
        [dictionary setObject:self.city  forKey:@"City"];
        [dictionary setObject:self.stateCode forKey:@"StateCode"];
        [dictionary setObject:[NSString stringWithFormat:@"%ld",(long)self.zipCode] forKey:@"ZipCode"];
        [dictionary setObject:self.country forKey:@"Country"];
    }
}

@end
