//
//  Header.h
//  ScrollChangeEffect
//
//  Created by melo on 2018/12/23.
//  Copyright © 2018 陈诚. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height

#define isIPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#define NavigationHeight  isIPhoneX ? 88 : 64
#endif /* Header_h */
