//
//  HNArticleCell.m
//  HackerNews
//
//  Created by Matthew Stanford on 8/31/13.
//  Copyright (c) 2013 Matthew Stanford. All rights reserved.
//

#import "HNArticleCell.h"

@implementation HNArticleCell

@synthesize delegate, articleTitleLabel, commentView, articleGR, commentGR, topMargin, bottomMargin;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        articleTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [articleTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
		[articleTitleLabel setNumberOfLines:0];
        articleTitleLabel.backgroundColor = [UIColor clearColor];
        articleTitleLabel.userInteractionEnabled = TRUE;
        
        commentView = [[UIView alloc] initWithFrame:CGRectZero];
        
        articleGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
        articleGR.delegate = self;
        [articleTitleLabel addGestureRecognizer:articleGR];
        
        commentGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTapped:)];
        commentGR.delegate = self;
        [commentView addGestureRecognizer:commentGR];
        
        
        [self addSubview:articleTitleLabel];
        [self addSubview:commentView];
        
        //These values should be set by the view controller
        self.topMargin = 0;
        self.bottomMargin = 0;
        
        
    }
    return self;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    ///Need to catch the GR before it "receives" the touch so that the touch is received by the table view
    if (gestureRecognizer == self.articleGR)
    {
        [self articleTapped:gestureRecognizer];
        return NO;
    }

    return YES;
}

- (void) articleTapped:(UITapGestureRecognizer *)recognizer
{
    [delegate didTapArticle:self];
}

- (void) commentTapped:(UITapGestureRecognizer *)recognizer
{
    [delegate didTapComment:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (void)layoutSubviews {
	[super layoutSubviews];
    
    CGFloat commentViewWidth = 100;
    CGFloat articleViewWidth = self.frame.size.width - commentViewWidth;
    CGFloat labelHeight = self.frame.size.height - self.topMargin - self.bottomMargin;
    
    [articleTitleLabel setFrame:CGRectMake(0, self.topMargin, articleViewWidth, labelHeight)];
    [commentView setFrame:CGRectMake(articleViewWidth, self.topMargin, commentViewWidth, labelHeight)];
    
}


@end
