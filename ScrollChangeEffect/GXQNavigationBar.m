//
//  GXQNavigationBar.m
//  ScrollChangeEffect
//
//  Created by melo on 2018/12/23.
//  Copyright © 2018 陈诚. All rights reserved.
//

#import "GXQNavigationBar.h"

@interface GXQNavigationBar ()

@property (nonatomic, strong) UILabel *titleLb;
@end

@implementation GXQNavigationBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, Screen_width, NavigationHeight);
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLb];
        self.titleLb.frame = CGRectMake(self.frame.size.width / 2 - 50, 44, 100, 20);
    }
    return self;
}

-(void)setTitle:(NSString *)title {
    _title = title;
    _titleLb.text = title;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLb;
}
@end
