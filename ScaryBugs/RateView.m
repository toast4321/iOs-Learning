//
//  RateView.m
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RateView.h"

@implementation RateView
@synthesize notSelectedImage = _notSelectedImage;
@synthesize halfSelectedImage = _halfSelectedImage;
@synthesize fullSelectedImage = _fullSelectedImage;

@synthesize rating = _rating;
@synthesize editable = _editable;
@synthesize maxRating = _maxRating;
@synthesize delegate = _delegate;
@synthesize leftMargin = _leftMargin;

#pragma mark Main
- (void)baseInit {
    _imageViews = [NSMutableArray array];
    _notSelectedImage = nil;
    _halfSelectedImage = nil;
    _fullSelectedImage = nil;
    
    _rating = 0;
    _editable = NO;
    _maxRating = 0;
    _leftMargin = 0;
    _midMargin = 5;
    _minImageSize = CGSizeMake(5, 5);
    
    self.backgroundColor = [UIColor clearColor];
}

- (id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])){
        [self baseInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])){
        [self baseInit];
    }
    
    return self;
}

- (void)refresh{
    for (int i = 0; i < _imageViews.count; ++i) {
        UIImageView *imageView = [_imageViews objectAtIndex:i];
        
        if (_rating >= i+1){
            imageView.image = _fullSelectedImage;
        } else if(_rating > i){
            imageView.image = _halfSelectedImage;
        } else{
            imageView.image = _notSelectedImage;
        }
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (_notSelectedImage == nil)
        return;
    
    float desiredImageWidth = (self.frame.size.width - (_leftMargin * 2) - (_midMargin * _imageViews.count)) / _imageViews.count;
    float imageWidth = MAX(_minImageSize.width, desiredImageWidth);
    float imageHeight = MAX(_minImageSize.height, self.frame.size.height);
    
    for (int i = 0; i < _imageViews.count; ++i){
        UIImageView *imageView = [_imageViews objectAtIndex:i];
        CGRect imageFrame = CGRectMake(_leftMargin + i * (_midMargin + imageWidth), 0, imageWidth, imageHeight);
        imageView.frame = imageFrame;
    }
}

- (void)setMaxRating:(int)maxRating{
    _maxRating = maxRating;
    
    //remove old image views
    for (int i = 0; i < _imageViews.count; ++i) {
        UIImageView *imageView = (UIImageView *) [_imageViews objectAtIndex:i];
        [imageView removeFromSuperview];
    }
    
    [_imageViews removeAllObjects];
    
    //add new image views
    for (int i = 0; i < maxRating; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_imageViews addObject:imageView];
        [self addSubview:imageView];
    }
    
    //relayout and refresh
    [self setNeedsLayout];
    [self refresh];
}

- (void)setNotSelectedImage:(UIImage *)image{
    [self refresh];
}

- (void)setHalfSelectedImage:(UIImage *)image{
    [self refresh];
}

- (void)setFullSelectedImage:(UIImage *)image{
    [self refresh];
}

- (void)setRating:(float)rating{
    _rating = rating;
    [self refresh];
}

- (void)handleTouchAtLocation:(CGPoint)touchLocation{
    if(!_editable) return;
    
    _rating = 0;
    
    for (int i = _imageViews.count - 1; i >= 0; i--) {
        UIImageView *imageView = [_imageViews objectAtIndex:i];
        if (touchLocation.x > imageView.frame.origin.x){
            _rating = i + 1;
            break;
        }
    }
    
    [self refresh];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_delegate rateView:self ratingDidChange:_rating];
}

@end


