//
//  DetailViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "DetailViewController.h"
#import "APIRequest.h"

@interface DetailViewController ()
@property (strong, nonatomic) APIRequest *apiRequest;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *webAddress = [self.place valueForKey:@"link"];
    
    NSLog(@"%@",webAddress);
    
    // set the title of navigation item
    self.title = [NSString stringWithFormat:@"@%@", [[self.place  objectForKey:@"user"] valueForKey:@"username"]];
    
    
    NSURL *url = [NSURL URLWithString:webAddress];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
    
    
}
-(void) loading{
    if(!self.myWebView.loading){
        
    }else{
    }
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

