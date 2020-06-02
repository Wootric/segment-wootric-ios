//
//  WTRWootricIntegration.m
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 12/11/15.
//

#import "WTRWootricIntegration.h"
#import "WTRWootricUtils.h"

@implementation WTRWootricIntegration

- (id)initWithSettings:(NSDictionary *)settings {
  if (self = [super init]) {
    _settings = settings;
    NSString *clientID = _settings[@"clientId"];
    NSString *accountToken = _settings[@"accountToken"];
    [Wootric configureWithClientID:clientID accountToken:accountToken];
  }

  return self;
}

- (void)identify:(SEGIdentifyPayload *)payload {
  NSString *email = payload.traits[@"email"];
  NSString *dateString = payload.traits[@"createdAt"];
  NSMutableDictionary *endUserProperties = [payload.traits mutableCopy];
  NSNumber *timestamp = [WTRWootricUtils timestampFromCreatedAt:dateString];

  [endUserProperties removeObjectsForKeys:@[@"email", @"createdAt"]];
  [Wootric setEndUserEmail:email];
  [Wootric setEndUserCreatedAt:timestamp];
  [Wootric setEndUserProperties:endUserProperties];
}

- (void)track:(SEGTrackPayload *)payload {
  NSDictionary *properties = payload.properties;
  NSString *eventName = payload.event;
  NSString *language = [properties objectForKey:@"language"];

  if (language) {
    [Wootric setCustomLanguage:language];
  }

  [Wootric setEventName:eventName];
}

+ (SEGWootric *)wootric {
  return [[SEGWootric alloc] init];
}

+ (void)showSurveyInViewController:(UIViewController *)viewController {
  [[self wootric] showSurveyInViewController:viewController];
}

@end
