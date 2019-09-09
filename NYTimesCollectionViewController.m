//
//  NYTimesCollectionViewController.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "NYTimesCollectionViewController.h"
#import "APIRequest.h"
#import "NYTimesCollectionViewCell.h"
#import "NYTimesViewController.h"

@interface NYTimesCollectionViewController ()

@property (strong, nonatomic) APIRequest *apiRequests;
@property (strong, nonatomic) NYTimesCollectionViewCell *viewCell;
@property (strong, nonatomic) NYTimesViewController *detailView;
@property (strong, nonatomic) NSArray* returnNYTimesArray;


@end

@implementation NYTimesCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set up model singleton
    self.apiRequests = [APIRequest sharedModel];
    self.viewCell = [[NYTimesCollectionViewCell alloc]init];
    self.detailView = [[NYTimesViewController alloc] init];
    self.returnNYTimesArray = [[NSArray alloc]init];
    
    NSLog(@"%@",[self.apiRequests loadNYTimesArray]);
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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

    return [self.apiRequests numberOfRequests:[self.apiRequests loadNYTimesArray]];

}

- (NYTimesCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NYTimesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    self.returnNYTimesArray = [self.apiRequests loadInstagramArray];
    // Configure the cell
    NSDictionary *dictionaryNYTimes = [self.apiRequests request:[self.apiRequests loadNYTimesArray] AtIndex:indexPath.row];
    NSLog(@"%@", dictionaryNYTimes);
    
   [cell addCells:dictionaryNYTimes];
    
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
        
        _detailView.place = [self.apiRequests loadNYTimesArray][indexPath.row];
        
    }
}

@end
