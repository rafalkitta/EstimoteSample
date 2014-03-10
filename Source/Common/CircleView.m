//
//  CircleView.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 09.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   _color.CGColor);
    CGContextFillEllipseInRect(context, rect);
    CGContextStrokePath(context);
    
    
}


@end
