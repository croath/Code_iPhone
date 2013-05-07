//
//  Common.m
//  DoubanMovie
//
//  Created by ehll on 11-10-13.
//  Copyright 2011年 douban. All rights reserved.
//

#import "Common.h"


#pragma mark - App Info
NSString* const kAppUid = @"movie1";
NSString* const kAppScheme = @"doubanmovie";
NSString* const kAppStoreID = @"446745748";

#pragma mark - API
NSString* const kAPIKey = @"0df993c66c0c636e29ecbb5344252a4a";
NSString* const kPrivateKey = @"33978dee2af2953f";
NSString* const kRedirectUrl = @"http://movie.douban.com";


NSString* const kAppAPIUrl = API_BASE_URL@"/app";
NSString* const kMovieAPIUrl = API_BASE_URL@"/movie";
NSString* const kMovieAPIUrlV2 = API_BASE_URL@"/v2/movie";
NSString* const kPeopleAPIUrl = API_BASE_URL@"/people";
NSString* const kReviewAPIUrl = API_BASE_URL@"/review";
NSString* const kMapAPIUrl = MAP_API_BASE_URL@"/geocode";
NSString* const kCollectionAPIUrl = API_BASE_URL@"/collection";
NSString * const kAuth2Url = @"https://www.douban.com/service/auth2/auth";
NSString * const kAuth2TokenUrl = @"https://www.douban.com/service/auth2/token";
NSString* const kDefaultStoreUrl = @"http://itunes.apple.com/app/id446745748";

#pragma mark - Request Error
NSString* const kBannedWordException = @"有被禁止的内容";

#pragma mark - location
NSString* const kLatitudeKey = @"latitudekey";
NSString* const kLongitudeKey = @"longitudekey";

#pragma mark - date
NSString* const kUTCDatetimeFormat = @"yyyy-MM-dd'T'HH:mm:ssz";
NSString* const kDefaultDatetimeFormat = @"yyyy-MM-dd HH:mm:ss";
NSString* const kDefaultDateFormat = @"yyyy-MM-dd";

#pragma mark - identiferkey
NSString* const kRequestIdentifierKey = @"requestIdentifierKey";
NSString* const kRequestNotiNameKey   = @"requestNotiNameKey";
NSString* const kXAuthTokenKey = @"XAuthTokenKey";
NSString* const kRequestResultKey = @"RequestResultKey";
NSString* const kRequestUserInfoKey = @"RequestUserInfoKey";
NSString* const kRequestStatusCodeKey = @"RequestStatusCodeKey";
NSString* const kRequestKey = @"requestKey";
#pragma mark - consts
NSInteger const kNumOfLoadCinemas = 85;
NSString* const kWatched = @"watched";

NSString* const kFontNameSTHeitiJMedium = @"STHeitiJ-Medium";
NSString* const kFontNameSTHeitiJLight = @"STHeitiJ-Light";
NSString* const kFontNameHelvetica = @"Helvetica";
NSString* const kFontNameHelveticaLight = @"Helvetica-Light";
NSString* const kFontNameHelveticaBold = @"Helvetica-Bold";

CGFloat const kTabBarHeight = 44.0;
NSInteger const kMaxLocateCounts = 3;
CGFloat const kNaviBarHeight = 44.0f;

NSInteger const kMaxCommentLength = 140;

NSString* const kUIImageNameBigStar = @"bigstar.png";
NSString* const kUIImageNameBIgStarActivated = @"bigstar_activated.png";

#pragma mark - Notification Names

NSString* const kNotificationNameLogin = @"NotificationNameLogin";
NSString* const kNotificationNameLogout = @"NotificationNameLogout";
NSString* const kNotificationNameHideNavBar = @"NotificationNameHideNavBar";
NSString* const kNotificationNameReloadFavoriteCinemas = @"NotificationNameReloadFavoriteCinemas";
NSString* const kNotificationNameReloadSchedules = @"NotificationNameReloadSchedules";
