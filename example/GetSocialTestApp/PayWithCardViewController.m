//
//  PayWithCardViewController.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "PayWithCardViewController.h"
#import "GSNetworkManager.h"
#import "CreditCardDetails.h"
#import "GSNetworkManager.h"
#import "GSNetworkManager+customer.h"
#import "GSNetworkManager+CreditCardDetails.h"

@interface PayWithCardViewController ()

@end

@implementation PayWithCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.tfCardNumber becomeFirstResponder];
    
    [self getUserDetailsForPayment];
   
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor] ;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor] ;

    self.navigationController.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setAlpha:0.7];
    
    // Call to Get Card Details If the user is Existing One
    [self getUserDetailsForPayment];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)RememberPressed:(UIButton *)sender {
}

- (IBAction)PayAmountPressed:(UIButton *)sender {

    
    
    
    if (_isNewCustomer) {
    
        CreditCardDetails * newCardDetails = [CreditCardDetails CardDetailsWithDictionary:nil];
        
        [GSNetworkManager createCreditCardDetails:newCardDetails success:^(NSURLSessionDataTask *operation, id responseObject) {
            
            self.OriginId = [responseObject valueForKey:@"Id"];
            
            [self payTheAmountToThePaySimple];
            
        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
            
        }];
        
    }
        else
        {
        
        
            [self payTheAmountToThePaySimple];
        
        }

    


}

-(void)textFieldDidEndEditing:(UITextField *)textField
{

    [textField resignFirstResponder];


}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{


[textField resignFirstResponder];
    return YES;

}

// Gey Card Detaails
-(void)getUserDetailsForPayment
{
if(!_isNewCustomer)
{
    [GSNetworkManager GetUserDetailsWithUserID:self.OriginId success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        // Update the textfeilds to show user details - pending
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
    }];
    

}



   
}

// Final Payment Call With user id and Amount
-(void)payTheAmountToThePaySimple
{



    [GSNetworkManager createPaymentWithAccountId:self.OriginId andAmount:@"150$" success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        [self performSegueWithIdentifier:@"PayWithCardToThankyou" sender:self];
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
    }];
    


}




@end
