//
//  PaymentOptionsViewController.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 13/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"
@interface PaymentOptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UILabel *bonusBalance;
@property (weak, nonatomic) IBOutlet UIView *payWithCardView;
@property(weak,nonatomic)NSString * first_name;
@property(weak,nonatomic)NSString * last_name;
@property(weak,nonatomic)NSString * OriginId;
@property(weak,nonatomic)Customer *customerdetails;
@property(nonatomic)BOOL isNewCustomer;
@end
