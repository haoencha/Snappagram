//
//  InstagramCollectionViewCell.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "InstagramCollectionViewCell.h"

@implementation InstagramCollectionViewCell


- (void) addCells:(NSDictionary *)dataDict{
    
    NSString *imageFileName = [[[dataDict objectForKey:@"images"] objectForKey:@"low_resolution"] valueForKey:@"url"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageFileName]];
    
    [self.imageView setImage:[UIImage imageWithData:data]];
   // self.imageView.image = [UIImage imageNamed:imageFileName];
    
    NSString *userName = [[[dataDict objectForKey:@"caption"] objectForKey:@"from"] valueForKey:@"username"];

    self.label.text =[NSString stringWithFormat:@"Posted by: %@", userName];
    NSLog(@"%@", userName);
    
}

@end
