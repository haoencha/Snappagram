//
//  APIRequest.h
//  Snappagram
//
//  Created by Hao-En Chang on 12/9/15.
//  haoencha@usc.edu
//  Copyright (c) 2015 Hao-En Chang. All rights reserved.
//


#import <Foundation/Foundation.h>

#define kAPIURl @"https://api.instagram.com/v1/media/"
#define kNYTIMES @"http://api.nytimes.com/svc/news/v3/content/nyt/all/%7Btime-period%7Djson?api-key=718e9c614a4e157613c18ea201dca81c%3A0%3A64325990"
#define kRottenTomato @"http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=test&page_limit=40&page=1&apikey=r7dff6zkcr7mepq83k8egepf"
#define kGoogleMaps  @"https://maps.googleapis.com/maps/api/geocode/json?address=taipei"
#define kiTunes @"https://itunes.apple.com/search?term="

#define kACCESSTOKEN @"184944904.1fb234f.8a0bd37da65c4461abe6d833c0415f9c"

@interface APIRequest : NSObject

+(instancetype) sharedModel;


-(NSDictionary*) loadNYTimesData;
-(NSArray*) loadNYTimesArray;
-(NSDictionary*)loadRequestForInstagramData;
-(NSArray*) loadInstagramArray;
-(NSArray*) loadiTunesArray: (NSString*) searchArtist;
-(NSDictionary*) loadiTunesData: (NSString*) searchArtist;

- (NSUInteger) numberOfRequests: (NSArray*) dataArray;
- (NSDictionary *) request: (NSArray*) dataArray AtIndex:(NSUInteger) index;
-(NSMutableArray *) requestDictionary;




@end