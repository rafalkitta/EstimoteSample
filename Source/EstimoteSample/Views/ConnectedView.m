//
//  ConnectedView.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 14.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "ConnectedView.h"

@implementation ConnectedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        _power = [[UILabel alloc] init];
        _power.backgroundColor = [UIColor clearColor];
        _power.textColor = [UIColor blackColor];
        _power.textAlignment = NSTextAlignmentLeft;
        _power.font = [UIFont fontWithName:@"HelveticaNeue-Bold"
                                      size:14.f];
        _power.lineBreakMode = NSLineBreakByWordWrapping;
        _power.numberOfLines = 1;
        [self addSubview:_power];
        
        _batteryLevel = [[UILabel alloc] init];
        _batteryLevel.backgroundColor = [UIColor clearColor];
        _batteryLevel.textColor = [UIColor blackColor];
        _batteryLevel.textAlignment = NSTextAlignmentLeft;
        _batteryLevel.font = [UIFont fontWithName:@"HelveticaNeue-Bold"
                                             size:14.f];
        _batteryLevel.lineBreakMode = NSLineBreakByWordWrapping;
        _batteryLevel.numberOfLines = 1;
        [self addSubview:_batteryLevel];
        
        _hardwareVersion = [[UILabel alloc] init];
        _hardwareVersion.backgroundColor = [UIColor clearColor];
        _hardwareVersion.textColor = [UIColor blackColor];
        _hardwareVersion.textAlignment = NSTextAlignmentLeft;
        _hardwareVersion.font = [UIFont fontWithName:@"HelveticaNeue-Bold"
                                                size:14.f];
        _hardwareVersion.lineBreakMode = NSLineBreakByWordWrapping;
        _hardwareVersion.numberOfLines = 1;
        [self addSubview:_hardwareVersion];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 10.f, 10.f);
    
    CGSize powerLabelSize = CGSizeMake(CGRectGetWidth(rectInset), 30.f);
    CGRect powerLabelRect = CGRectMake(CGRectGetMinX(rectInset),
                                       CGRectGetMinY(rectInset) + 70.f,
                                       powerLabelSize.width,
                                       powerLabelSize.height);
    _power.frame = powerLabelRect;
    
    CGSize batteryLabelSize = CGSizeMake(CGRectGetWidth(rectInset), 30.f);
    CGRect batteryLabelRect = CGRectMake(CGRectGetMinX(rectInset),
                                         CGRectGetMaxY(powerLabelRect) + 5.f,
                                         batteryLabelSize.width,
                                         batteryLabelSize.height);
    _batteryLevel.frame = batteryLabelRect;
    
    CGSize hardwareLabelSize = CGSizeMake(CGRectGetWidth(rectInset), 30.f);
    CGRect hardwareLabelRect = CGRectMake(CGRectGetMinX(rectInset),
                                          CGRectGetMaxY(batteryLabelRect) + 5.f,
                                          hardwareLabelSize.width,
                                          hardwareLabelSize.height);
    _hardwareVersion.frame = hardwareLabelRect;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Setters

- (void)setPower:(NSNumber *)power{
    _power.text = [NSString stringWithFormat:@"Power: %i dBm", [power intValue]];
    [self setNeedsLayout];
}

- (void)setBatteryLevel:(NSNumber *)bateryLevel{
    _batteryLevel.text = [NSString stringWithFormat:@"Battery level: %i %%", [bateryLevel intValue]];
    [self setNeedsLayout];
}

- (void)setHardwareVersion:(NSString *)hardwareVersion{
    _hardwareVersion.text = [NSString stringWithFormat:@"Hardware version: %@", hardwareVersion];
    [self setNeedsLayout];
}

@end
