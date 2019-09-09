//
//  DetailViewController.h
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@property (strong, nonatomic) NSDictionary *place;

@property (strong,nonatomic) NSTimer* timer;

@end
