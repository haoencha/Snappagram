//
//  NYTimesCollectionViewCell.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "NYTimesCollectionViewCell.h"

@implementation NYTimesCollectionViewCell

- (void) addCells:(NSDictionary *)dataDict{
    
    NSString *imageFileName;
    
    if([[dataDict objectForKey:@"multimedia"] isEqual: @""]){
        imageFileName = @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxIQScmLxNrZmomBJ2WJMbR1D95ay15mEPM84DBFwwDJhccAhL";
    }else{
        imageFileName = [[[dataDict objectForKey:@"multimedia"] objectAtIndex:2] valueForKey:@"url"];
    }
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageFileName]];
    
    [self.imageView setImage:[UIImage imageWithData:data]];
    // self.imageView.image = [UIImage imageNamed:imageFileName];
    
    NSString *title = [dataDict valueForKey:@"title"];
    
    NSString *author = [dataDict valueForKey:@"byline"];
    
    self.title.text =[NSString stringWithFormat:@"\"%@\"", title];
    self.author.text = author;
    NSLog(@"%@, %@", title, author);
    
    
    
}

@end
