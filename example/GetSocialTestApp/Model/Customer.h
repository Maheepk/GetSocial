//
//  Customer.h
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;

@interface Customer : NSObject

@property (nonatomic, assign) BOOL shippingSameAsBilling;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSString *customerAccount;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) Address* shippingAddress;
@property (nonatomic, strong) Address * billingAddress;

@property (nonatomic, strong)NSMutableDictionary *dictionary;

+ (instancetype)customerWithDictionary:(NSDictionary *)dictionary;


@end
