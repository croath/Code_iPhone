//
//  Common.h
//  DoubanMovie
//
//  Created by ehll on 11-10-13.
//  Copyright 2011年 douban. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <ytoolkit/ymacros.h>
#pragma - mark base urls

#if defined(USE_ZETA) && USE_ZETA
#define API_BASE_URL  @"https://api.movie-zeta.douban.com"
#define MOVIE_HOST_BASE_URL @"http://movie.movie-zeta.douban.com"
#define HTTP_API_BASE_URL  @"http://api.movie-zeta.douban.com"
//#define API_BASE_URL  @"https://api.pre10.douban.com"
//#define HTTP_API_BASE_URL  @"http://api.pre10.douban.com"
//#define MOVIE_HOST_BASE_URL @"http://movie.pre10.douban.com"
#else
#define API_BASE_URL  @"https://api.douban.com"
#define MOVIE_HOST_BASE_URL @"http://movie.douban.com"
#define HTTP_API_BASE_URL  @"http://api.douban.com"
#endif

#define MAP_API_BASE_URL @"http://maps.google.com/maps/api"


#pragma mark - App Info
extern NSString* const kAppUid;
extern NSString* const kAppScheme;
extern NSString* const kAppStoreID;

#pragma mark - API
extern NSString* const kAPIKey;
extern NSString* const kPrivateKey;
extern NSString* const kRedirectUrl;
extern NSString* const kMovieAPIUrl;
extern NSString* const kMovieAPIUrlV2;
extern NSString* const kAppAPIUrl;
extern NSString* const kPeopleAPIUrl;
extern NSString* const kReviewAPIUrl;
extern NSString* const kMapAPIUrl;
extern NSString* const kCollectionAPIUrl;
extern NSString * const kAuth2Url;
extern NSString * const kAuth2TokenUrl;
extern NSString* const kDefaultStoreUrl;

#pragma mark - Request Error
extern NSString* const kBannedWordException;

#pragma mark - location
extern NSString* const kLatitudeKey;
extern NSString* const kLongitudeKey;

#pragma mark - date
extern NSString* const kUTCDatetimeFormat;
extern NSString* const kDefaultDatetimeFormat;
extern NSString* const kDefaultDateFormat;

#pragma mark - identiferkey
extern NSString* const kRequestIdentifierKey;
extern NSString* const kRequestNotiNameKey;
extern NSString* const kXAuthTokenKey;
extern NSString* const kRequestResultKey;
extern NSString* const kRequestUserInfoKey;
extern NSString* const kRequestStatusCodeKey;
extern NSString* const kRequestKey;

#pragma mark - consts

extern NSInteger const kNumOfLoadCinemas;
extern NSString* const kWatched;

extern NSString* const kFontNameSTHeitiJMedium;
extern NSString* const kFontNameSTHeitiJLight;
extern NSString* const kFontNameHelvetica;
extern NSString* const kFontNameHelveticaLight;
extern NSString* const kFontNameHelveticaBold;

extern CGFloat const kTabBarHeight;
extern NSInteger const kMaxLocateCounts;
extern CGFloat const kNaviBarHeight;

extern NSInteger const kMaxCommentLength;

extern NSString* const kUIImageNameBigStar;
extern NSString* const kUIImageNameBIgStarActivated;

#pragma mark - Notification Names

extern NSString* const kNotificationNameLogin;
extern NSString* const kNotificationNameLogout;
extern NSString* const kNotificationNameHideNavBar;
extern NSString* const kNotificationNameReloadFavoriteCinemas;
extern NSString* const kNotificationNameReloadSchedules;