//
//  iTunesCollectionCollectionViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "iTunesCollectionCollectionViewController.h"
#import "APIRequest.h"
#import "iTunesCollectionViewCell.h"
#import "iTunesViewController.h"
#import "searchViewController.h"

@interface iTunesCollectionCollectionViewController ()
@property (strong, nonatomic) APIRequest *apiRequests;
@property (strong, nonatomic) iTunesCollectionViewCell*viewCell;
@property (strong, nonatomic) iTunesViewController *detailView;
@property (strong, nonatomic) searchViewController *searchView;


@end

@implementation iTunesCollectionCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.searchArtist.delegate = self;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.apiRequests = [APIRequest sharedModel];
    self.viewCell = [[iTunesCollectionViewCell alloc]init];
    self.detailView = [[iTunesViewController alloc] init];
    self.searchView = [[searchViewController alloc] init];

    self.search= [self.search stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    // validating search... if array returns zero, that means the search is not valid
    if([self.apiRequests loadiTunesArray: self.search].count == 0){
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle:@"Artist Not Found" message:@"We cannot find the artist you specified. How about trying out some Eminem songs?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [errorAlert show];
        
        self.search =@"eminem";
    }
    NSLog(@"%@", [self.apiRequests loadiTunesArray: self.search]);
        
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return [self.apiRequests numberOfRequests:[self.apiRequests loadNYTimesArray]];
    //self.searchArtist.text;
    
    //NSString* searchArtist = [self.searchView artist];

    
//    NSLog(@"%lu", [self.apiRequests numberOfRequests:[self.apiRequests loadiTunesArray:searchArtist]]);

        return [self.apiRequests numberOfRequests:[self.apiRequests loadiTunesArray:self.search]];
  
}

- (iTunesCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    iTunesCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *dictionaryiTunes = [self.apiRequests request:[self.apiRequests loadiTunesArray:self.search] AtIndex:indexPath.row];
    //NSLog(@"%@", dictionaryiTunes);
    
    [cell addCells:dictionaryiTunes];
    return cell;
}

-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)[self.collectionView collectionViewLayout];
    if( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }else{
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Segue"]) {
        //        NSDictionary* dictionaryPlace = [[self.collectionView indexPathsForSelectedItems] firstObject];
        NSArray* placeArray = [self.collectionView indexPathsForSelectedItems];
        self.detailView = segue.destinationViewController;
        NSIndexPath *indexPath = [placeArray firstObject];
        
        _detailView.place = [self.apiRequests loadiTunesArray:self.search][indexPath.row];
                    
        
    }
}




//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
//}
//-(IBAction) backgroundTouchTap:(id)sender{
//   // [self.searchArtist resignFirstResponder];
//    
//}


@end
