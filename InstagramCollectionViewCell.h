//
//  InstagramCollectionViewCell.h
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void) addCells: (NSDictionary *) dataDict;


@end
