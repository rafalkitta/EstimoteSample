//
//  MainView.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 07.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "MainView.h"
#import "CircleView.h"

@implementation MainView{
    CircleView *_smallCircle;
    CircleView *_mediumCircle;
    CircleView *_largeCircle;
    CircleView *_bigCircle;
    UIImageView *_iPhoneImageView;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
//CIRCLES:
        _bigCircle = [[CircleView alloc] init];
        _bigCircle.color = [UIColor colorWithRed:204.f/255.f
                                           green:229.f/255.f
                                            blue:255.f/255.f
                                           alpha:1.f];
        [_bigCircle setNeedsDisplay];
        [self addSubview:_bigCircle];
        _largeCircle = [[CircleView alloc] init];
        _largeCircle.color = [UIColor colorWithRed:153.f/255.f
                                             green:204.f/255.f
                                              blue:255.f/255.f
                                             alpha:1.f];
        [_largeCircle setNeedsDisplay];
        [self addSubview:_largeCircle];
        _mediumCircle = [[CircleView alloc] init];
        _mediumCircle.color = [UIColor colorWithRed:102.f/255.f
                                              green:178.f/255.f
                                               blue:255.f/255.f
                                              alpha:1.f];
        [_mediumCircle setNeedsDisplay];
        [self addSubview:_mediumCircle];
        _smallCircle = [[CircleView alloc] init];
        _smallCircle.color = [UIColor colorWithRed:51.f/255.f
                                             green:153.f/255.f
                                              blue:255.f/255.f
                                             alpha:1.f];
        [_smallCircle setNeedsDisplay];
        [self addSubview:_smallCircle];
        
//_____________________________________
        
//LABEL:
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0f];
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        _label.numberOfLines = 0;
//        _label.text = @"TesteTestTest";
        [self addSubview:_label];
        
//_____________________________________
        
//IPHONE IMAGE:
        UIImage *iPhoneImage = [UIImage imageNamed:@"iPhone"];
        _iPhoneImageView = [[UIImageView alloc] initWithImage:iPhoneImage];
        [self addSubview:_iPhoneImageView];
        
//_____________________________________
        
//BEACON IMAGE:
        UIImage *beaconImage = [UIImage imageNamed:@"estimote-beacon"];
        _beaconImageView = [[BeaconImageView alloc] initWithImage:beaconImage];
        _beaconImageView.alpha = 1.f;
        _beaconImageView.delegate = self;
        [self addSubview:_beaconImageView];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 20.f, 50.f);
//_____________________________________
    
    CGSize labelSize = CGSizeMake(CGRectGetWidth(rectInset), 100.f);
    CGRect labelRect = CGRectMake(CGRectGetMinX(rectInset),
                                  CGRectGetMaxY(rect) - labelSize.height,
                                  labelSize.width,
                                  labelSize.height);
    _label.frame = labelRect;
//_____________________________________
    
    CGSize smallCircleSize = CGSizeMake(CGRectGetWidth(rectInset)/2, CGRectGetWidth(rectInset)/2);
    CGRect smallCircleRect = CGRectMake(CGRectGetMidX(rectInset) - smallCircleSize.width/2,
                                        CGRectGetMinY(rectInset),
                                        smallCircleSize.width,
                                        smallCircleSize.height);
    _smallCircle.frame = smallCircleRect;
    
    CGRect mediumCircleRect = CGRectInset(smallCircleRect, -80.f, -80.f);
    _mediumCircle.frame = mediumCircleRect;
    
    CGRect largeCircleRect = CGRectInset(mediumCircleRect, -90.f, -90.f);
    _largeCircle.frame = largeCircleRect;
    
    CGRect bigCircleRect = CGRectInset(largeCircleRect, -100.f, -100.f);
    _bigCircle.frame = bigCircleRect;
    
//_____________________________________
    
    _iPhoneImageView.center = CGPointMake(CGRectGetMidX(smallCircleRect),
                                          CGRectGetMidY(smallCircleRect));
}

#pragma mark - BeaconImageViewDelegate

-(void)changePosition:(NSNumber *)newY{
    _beaconImageView.center = CGPointMake(self.bounds.size.width / 2, [newY doubleValue]);
}

@end
