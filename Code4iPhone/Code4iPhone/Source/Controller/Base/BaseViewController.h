//
//  BaseViewController.h
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-9.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperation.h"
@interface BaseViewController : UIViewController
{
  AFHTTPRequestOperation * _networkOperation;
}

@property (nonatomic, strong, readonly) UILabel * titleLabel;
//@property (nonatomic, assign, readwrite) BOOL isOldViewController;
@property (nonatomic, unsafe_unretained, readwrite) BOOL needTabbar; //whether to show tab bar when the view controller apear.
@property (nonatomic, unsafe_unretained, readwrite) BOOL customBackButton;
@property (nonatomic, strong, readwrite) AFHTTPRequestOperation * networkOperation;
- (void)popToParent;
- (void)backUp:(id)sender;
- (BOOL)checkResponseError:(NSError *)error;
- (BOOL)checkResponseDictionary:(NSDictionary *)dictionary;
@end
