//
//  PaymentOptionsViewController.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 13/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "PaymentOptionsViewController.h"
#import "GSNetworkManager.h"
#import "GSNetworkManager+customer.h"
#import "GSNetworkManager+CreditCardDetails.h"
#import "PayWithCardViewController.h"

@interface PaymentOptionsViewController ()

@end

@implementation PaymentOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.payWithCardView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(payithCardPressed)]];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor] ;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;

    // Call The Find the user from Paysimple using its First and Last name 
    [self PostCustomerIdWithFirstName:self.first_name andLastname:self.last_name];
    self.isNewCustomer = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"PaymentOptionToPayWithCard"])
    {
        
        PayWithCardViewController * vc = segue.destinationViewController;
        vc.currentUser = self.customerdetails;
        vc.isNewCustomer = _isNewCustomer;
        vc.OriginId = _OriginId;
    
    
    
    }



}


// Pay WithCard pressed
-(void)payithCardPressed
{


    [self performSegueWithIdentifier:@"PaymentOptionToPayWithCard" sender:self];

}
-(void)getUserCardDetails
{





}
// Create New Customer in Paysimple
-(void) CreateNewCustomerWithFirstName:(NSString *) first_name andLast_name:(NSString *) last_name
{
    
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:first_name,@"first_name",last_name,@"last_name" ,nil];
    
    
    [GSNetworkManager  createCustomer:[Customer customerWithDictionary:dict] success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        self.OriginId = [responseObject valueForKey:@"Id"];
        self.customerdetails = [Customer customerWithDictionary:responseObject];
                _isNewCustomer = YES;
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error.description);
    }];
    
    
    
}

// Query to find an Existing Customer
-(void)PostCustomerIdWithFirstName:(NSString *) firstName andLastname:(NSString *) lastName
{
    
    [GSNetworkManager GetCustomerWithName:[NSString stringWithFormat:@"%@ %@",firstName,lastName] success:^(NSURLSessionDataTask *operation, id responseObject) {
        
       
        if(responseObject[@"Results"] == nil)
        {
        
             // If no user found Call to create New Customer
            [self CreateNewCustomerWithFirstName:self.first_name andLast_name:self.last_name];
            
            
        
        }
        else
        {
            self.OriginId = [responseObject[@"Results"] valueForKey:@"OriginId"];
            _isNewCustomer = NO;
        }
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
    }];
    
    
    
    
    
}

@end
