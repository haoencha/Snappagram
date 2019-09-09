//
//  NYTimesViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "NYTimesViewController.h"
#import "APIRequest.h"

@interface NYTimesViewController ()
@property (strong, nonatomic) APIRequest *apiRequest;

@end

@implementation NYTimesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *webAddress = [self.place valueForKey:@"url"];
    
    NSLog(@"%@",webAddress);
    
    // set the title of navigation item
    self.title = @"New York Times";
    
    
    NSURL *url = [NSURL URLWithString:webAddress];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];

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

@end
