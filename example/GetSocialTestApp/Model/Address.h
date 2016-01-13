//
//  Address.h
//  GetSocialTestApp
//
//  Created by Maheep Kaushal on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic, strong) NSString *streetAddress1;
@property (nonatomic, strong) NSString *streetAddress2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *stateCode;
@property (nonatomic, assign) NSInteger zipCode;
@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong)NSMutableDictionary *dictionary;

+ (instancetype)addressWithDictionary:(NSDictionary *)dictionary;

@end
