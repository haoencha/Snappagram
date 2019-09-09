//
//  iTunesViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "iTunesViewController.h"
#import "APIRequest.h"

@interface iTunesViewController ()

@property (strong, nonatomic) APIRequest *apiRequest;

@end

@implementation iTunesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *myString = [self.place valueForKey:@"trackName"];
    myString = [myString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
  NSString *webAddress = [NSString stringWithFormat:@"https://www.youtube.com/results?search_query=%@", myString];
    
    NSLog(@"%@",webAddress);
    
    // set the title of navigation item
    self.title = [self.place valueForKey:@"trackName"];
    
    
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
