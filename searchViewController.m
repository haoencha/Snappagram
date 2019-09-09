//
//  searchViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "searchViewController.h"
#import "iTunesCollectionCollectionViewController.h"
@interface searchViewController ()

@property (strong, nonatomic) iTunesCollectionCollectionViewController *collectionView;


@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchArtist.delegate = self;
    
    self.collectionView = [[iTunesCollectionCollectionViewController alloc]init];

   // NSLog(@"%@", self.searchArtist.text);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchPressed:(id)sender {
   
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   // GoalDetailsViewController *goalsDetailsViewController = [(UINavigationController*)segue.destinationViewController topViewController];

    if ([segue.identifier isEqualToString:@"Segue"]) {
        //        NSDictionary* dictionaryPlace = [[self.collectionView indexPathsForSelectedItems] firstObject];
        
        self.collectionView = [(UINavigationController*)segue.destinationViewController topViewController];
        
        
        // passing data to iTunesCollectionCollectionView controller
        _collectionView.search = self.searchArtist.text;
        
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void) touchesBegan: (NSSet *)touches
            withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.searchArtist isFirstResponder] &&
        [touch view] != self.searchArtist) {
        [self.searchArtist resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}




@end
