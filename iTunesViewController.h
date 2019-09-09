//
//  iTunesViewController.h
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iTunesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSDictionary *place;

@property (strong,nonatomic) NSTimer* timer;
@end
