//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Tosin Onafowokan on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(void) drawRect:(CGRect)rect{
    //what rectangle am i filling?
    CGRect bounds = [self bounds];
    
    //where is its center?
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //from the center how far to a corner?
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;
    
    //get the context being drawn upon
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //all lines will be draw 10 points wide
    CGContextSetLineWidth(context, 10);
    
    //set the stroke color to light gray
    //[[UIColor lightGrayColor] setStroke];
    
    //draw concentric circle from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [[UIColor colorWithRed:(float)rand() / RAND_MAX green:(float)rand()/RAND_MAX blue:(float)rand()/RAND_MAX alpha:1.0] setStroke];
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    //create a string
    NSString *text = @"You are getting sleepy";
    
    //get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    //where am i going to draw it?
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    //set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    // Set the shadow to be offset 4 points right, 3 points down,
    // dark gray and with a blur radius of 2 points
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    //draw the string
    [text drawInRect:textRect withFont:font];
}
@end
