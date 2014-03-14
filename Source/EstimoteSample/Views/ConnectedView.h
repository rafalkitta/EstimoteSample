//
//  ConnectedView.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 14.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectedView : UIView{
    UILabel *_power;
    UILabel *_batteryLevel;
    UILabel *_hardwareVersion;
}

- (void)setPower:(NSNumber *)power;
- (void)setBatteryLevel:(NSNumber *)bateryLevel;
- (void)setHardwareVersion:(NSString *)hardwareVersion;

@end
