
//
//  APIRequest.m
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//

#import "APIRequest.h"


@interface APIRequest()

@property (strong, nonatomic) NSArray *requests;
@property (assign, nonatomic) NSUInteger currentIndex;
@property (strong, nonatomic) NSString *filePath;

@end


@implementation APIRequest

+(instancetype) sharedModel{
    static APIRequest *sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken,^{
        
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}
- (instancetype)init
{
    self = [super init];
    if (self){
        
        [self loadNYTimesData];
        
    }
    return self;
}

-(NSDictionary*) loadNYTimesData{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kNYTIMES]];
    NSDictionary *NYTimesResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    
    return NYTimesResponse;
   // NSLog(@"%@",jsonNYTimesData);
    
}
-(NSArray*) loadNYTimesArray{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kNYTIMES]];
    NSDictionary *NYTimesResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *jsonNYTimesData = [NYTimesResponse objectForKey:@"results"];
    
    return jsonNYTimesData;
}

-(NSDictionary*)loadRequestForInstagramData {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@popular?access_token=%@",kAPIURl,kACCESSTOKEN]]];
    
    // [[ NSUserDefaults standardUserDefaults] valueForKey:KACCESS_TOKEN]]]];
    // Here you can handle response as well
    NSDictionary *InstagramResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
   // NSArray *jsonData = [InstagramResponse objectForKey:@"data"];
    
    return InstagramResponse;
    
}
-(NSArray*) loadInstagramArray{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@popular?access_token=%@",kAPIURl,kACCESSTOKEN]]];
    
    // [[ NSUserDefaults standardUserDefaults] valueForKey:KACCESS_TOKEN]]]];
    // Here you can handle response as well
    NSDictionary *InstagramResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *jsonData = [InstagramResponse objectForKey:@"data"];
    return jsonData;
}
-(NSDictionary*) loadiTunesData: (NSString*) searchArtist{
    NSString* url = [NSString stringWithFormat:@"%@%@", kiTunes,searchArtist];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: url]];
    NSDictionary *iTunesResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return iTunesResponse;
    
}

-(NSArray*) loadiTunesArray: (NSString*) searchArtist{
    NSString* url = [NSString stringWithFormat:@"%@%@",kiTunes,searchArtist];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: url]];
    NSDictionary *iTunesResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    NSArray *jsoniTunesData = [iTunesResponse objectForKey:@"results"];

    //NSLog(@"%@",jsoniTunesData);
    
    return jsoniTunesData;

}


-(void) loadRottenTomatoData{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kRottenTomato]];
    NSDictionary *RottenTomatoResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *jsonRottenTomatoData = [RottenTomatoResponse objectForKey:@"movies"];
    
    NSLog(@"%@",jsonRottenTomatoData);
    
}

//-(void) parseInstagramImageURLJSON: (NSArray*) jsonData{
//    for(int i =0 ; i<jsonData.count; i++){
//        NSLog(@"Images: %@",[[[[jsonData objectAtIndex:i] objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"]);
//    }
//    NSString *url_Img = [[[[jsonData objectAtIndex:1]objectForKey:@"images"]objectForKey:@"thumbnail"]objectForKey:@"url"];
//    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url_Img]];
//    
//    //[self.imageView setImage:[UIImage imageWithData:data]];
//    
//}
//
//-(void) parseInstagramCaptionJSON: (NSArray *) jsonData{
//    for(int i =0 ; i<jsonData.count; i++){
//        NSLog(@"Caption: %@",[[[jsonData objectAtIndex:i] objectForKey:@"caption"] objectForKey:@"text"]);
//    }
//}
//
//-(void) parseInstagramUserJSON: (NSArray*) jsonData{
//    for(int i =0 ; i<jsonData.count; i++){
//        NSLog(@"Username: %@",[[[[jsonData objectAtIndex:i] objectForKey:@"caption"] objectForKey:@"from"]objectForKey:@"username"]);
//    }
//}

- (NSUInteger) numberOfRequests: (NSArray*)dataArray{
    return [dataArray count];
}
- (NSDictionary *) request:(NSArray*) dataArray AtIndex:(NSUInteger) index{
    return dataArray[index];
}

-(NSArray *) requestDictionary{
    return self.requests;
}


@end
