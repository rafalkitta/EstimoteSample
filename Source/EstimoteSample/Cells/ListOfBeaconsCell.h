//
//  ListOfBeaconsCell.h
//  EstimoteSample
//
//  Created by Rafał Kitta on 12.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListOfBeaconsCell : UITableViewCell{
    UILabel *_MACAdressLabel;
    UILabel *_majorLabel;
    UILabel *_minorLabel;
    UILabel *_rssiLabel;
}

- (void)setMACAdress:(NSString *)MACAdress;
- (void)setMajor:(NSNumber *)major;
- (void)setMinor:(NSNumber *)minor;
- (void)setRSSI:(NSNumber *)rssi;

@end
