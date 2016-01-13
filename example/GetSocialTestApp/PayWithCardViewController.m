//
//  PayWithCardViewController.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "PayWithCardViewController.h"

@interface PayWithCardViewController ()

@end

@implementation PayWithCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.tfCardNumber becomeFirstResponder];
    
    [self getUserDetailsForPayment];
    [self GetIDForThePaymentInfoWithObjectAndCallForPaymentWithDict:nil];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor] ;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor] ;

    self.navigationController.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setAlpha:0.7];
    
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

    
    NSString * urlString = @"https://sandbox-api.paysimple.com/v4/customer/321440/defaultcreditcard";
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
   [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *  task, id   responseObject) {
       
       NSLog(@"%@",responseObject);
       [self GetIDForThePaymentInfoWithObjectAndCallForPaymentWithDict:responseObject];
   } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
      
       NSLog(@"%@",error.description);
   }];
    
    [self performSegueWithIdentifier:@"PayWithCardToThankyou" sender:self];
    
    
    


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
-(void)getUserDetailsForPayment
{


 

   
}
-(void)GetIDForThePaymentInfoWithObjectAndCallForPaymentWithDict:(NSDictionary *) dic
{

    
    NSString * urlString = @"https://sandbox-api.paysimple.com/v4/payment";
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
//    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"517918",@"AccountId",
//        @"30",@"Amount",
//        @"false","IsDebit" ,
//        @"123AB",@"InvoiceNumber",
//        @"77652",@"PurchaseOrderNumber" ,
//        @"AB999",@"OrderId",
//        @"A one time payment for a new customer",@"Description",
//        @"999" ,"CVV" ,
//       @"MOTO", @"PaymentSubType",nil];
    
    [manager POST:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id   responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        
    }];
    

}




@end
