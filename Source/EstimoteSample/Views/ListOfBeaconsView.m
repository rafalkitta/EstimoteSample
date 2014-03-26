//
//  ListOfBeaconsView.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 12.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "ListOfBeaconsView.h"

@implementation ListOfBeaconsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // Initialization code
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
        [_tableView setSeparatorColor:[UIColor darkGrayColor]];
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        
        [_tableView setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 2.0f, 10.0f);
    
    CGSize tableSize = CGSizeMake(CGRectGetWidth(rectInset), CGRectGetHeight(rectInset));
    CGRect tableRect = CGRectMake(CGRectGetMinX(rectInset),
                                  CGRectGetMinY(rectInset),
                                  tableSize.width,
                                  tableSize.height);
    _tableView.frame = tableRect;
}

@end
