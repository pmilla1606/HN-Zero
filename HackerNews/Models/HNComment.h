//
//  HNComment.h
//  HackerNews
//
//  Created by Matthew Stanford on 9/5/13.
//  Copyright (c) 2013 Matthew Stanford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNComment : NSObject
{
    NSArray *textBlocks;
    NSString *author;
    NSString *dateWritten;
    NSNumber *nestedLevel;
    
}

@property (nonatomic, strong) NSArray *textBlocks;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *dateWritten;
@property (nonatomic, strong) NSNumber *nestedLevel;

@end
