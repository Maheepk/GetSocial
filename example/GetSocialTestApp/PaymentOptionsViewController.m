//
//  PaymentOptionsViewController.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 13/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "PaymentOptionsViewController.h"

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


-(void)payithCardPressed
{


    [self performSegueWithIdentifier:@"PaymentOptionToPayWithCard" sender:self];

}

@end
