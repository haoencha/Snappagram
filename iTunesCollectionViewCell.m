//
//  iTunesCollectionViewCell.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "iTunesCollectionViewCell.h"

@implementation iTunesCollectionViewCell

- (void) addCells:(NSDictionary *)dataDict{
    
    NSString *imageFileName;
    
    if([[dataDict valueForKey:@"artworkUrl100"] isEqual: @""]){
        imageFileName = @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxIQScmLxNrZmomBJ2WJMbR1D95ay15mEPM84DBFwwDJhccAhL";
    }else{
        imageFileName = [dataDict valueForKey:@"artworkUrl100"];
    }
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageFileName]];
    
    [self.imageView setImage:[UIImage imageWithData:data]];
    // self.imageView.image = [UIImage imageNamed:imageFileName];
    
    NSString *track = [dataDict valueForKey:@"trackName"];
    
    
    self.trackName.text = track;
    NSLog(@"%@" , track);
    
    
    
}
@end
