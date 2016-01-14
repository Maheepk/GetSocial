//
//  LoginViewController.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginModel.h"


@interface LoginViewController : UIViewController


@property(strong,nonatomic)LoginModel *loginModel;
@property(weak,nonatomic)NSString * first_name;
@property(weak,nonatomic)NSString * last_name;
- (IBAction)ConnectPressed:(id)sender;

@end
