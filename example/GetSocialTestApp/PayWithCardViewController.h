//
//  PayWithCardViewController.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking/AFNetworking.h"
@interface PayWithCardViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfCardNumber;
@property (weak, nonatomic) IBOutlet UITextField *tfCadHolder;
@property (weak, nonatomic) IBOutlet UITextField *tfValidUpto;
@property (weak, nonatomic) IBOutlet UITextField *tfCVC;
- (IBAction)RememberPressed:(UIButton *)sender;
- (IBAction)PayAmountPressed:(UIButton *)sender;

@end
