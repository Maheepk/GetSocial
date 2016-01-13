//
//  LoginViewController.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "LoginViewController.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "GSNetworkManager.h"
#import "GSNetworkManager+customer.h"
#import "Customer.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    _loginModel = [[LoginModel alloc] init];
 //   [self PostCustomerIdWithFirstName:@"hello" andLastname:@"hello"];

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

- (IBAction)ConnectPressed:(id)sender {
    
    

    
    [PFFacebookUtils logInInBackgroundWithReadPermissions:@[ @"email" ] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
              [self performSegueWithIdentifier:@"logintoPayment" sender:self];
//
        } else {
            
            [self performSegueWithIdentifier:@"logintoPayment" sender:self];
//            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"email,name,first_name,last_name"}]
//             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                 if (!error) {
//                     NSLog(@"fetched user:%@", result);
//                     NSLog(@"%@",result[@"email"]);
//                     
//                 }
//             }];
//
            
            NSLog(@"User logged in through Facebook!");
            
        }
    }];
    
  
    
    



}

-(void)PostCustomerIdWithFirstName:(NSString *) firstName andLastname:(NSString *) lastName
{

    
//    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
//    [dict setValue:firstName forKey:@"FirstName"];
//    [dict setValue:lastName forKey:@"LastName"];
//    Customer * new =    [Customer customerWithDictionary:dict];
   
    
   [GSNetworkManager  getAllCustomersWithSuccess:^(NSURLSessionDataTask *operation, id responseObject) {
       
       NSLog(@"%@",responseObject);
       
   } failure:^(NSURLSessionDataTask *operation, NSError *error) {
       
       NSLog(@"%@",error.description);
   }];


}
- (void)loginWithFacebook
{
   
}



- (void)loginWithFacebookWithHandler:(FBSDKLoginManagerRequestTokenHandler)handler
{
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    [login logInWithReadPermissions:@[ @"email", @"user_friends" ] fromViewController:self handler:handler];
}


@end
