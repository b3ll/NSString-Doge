//
//  NSString+Doge.m
//  NSDogeString
//
//  Created by Adam Bell on 6/18/14.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

/*
 ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░ So NSString
 ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░
 ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░
 ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░
 ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░
 ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░
 ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░
 ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░
 ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░
 ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░
 ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░ Very Category
 ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
 ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░
 ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░
 ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░
 ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░
 ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░
 ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░
 ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░
 */

#import "NSString+Doge.h"

#import <objc/runtime.h>

static NSString * const IsInDescriptionKey = @"IsInDescription";
static char const * const AlreadyDogedKey = "AlreadyDogedKey";

@implementation NSString (doge)

static NSArray *_words;
static NSArray *_otherWords;

- (NSString *)dogeString
{
  if (self.doge_isAlreadyDoged || self.doge_isCurrentThreadDogeing) {
    return self;
  }

  [self doge_setCurrentThreadDogeing:YES];
  NSString *string = [NSString stringWithFormat:@"%@ %@.%@",
                      _words[arc4random() % (_words.count - 1)],
                      self,
                      arc4random() % 2 ? @" wow." : @""];
  [self doge_setCurrentThreadDogeing:NO];

  [string doge_setAlreadyDoged:YES];
  return string;
}

- (NSString *)doge_description
{
  return [[self dogeString] doge_description];
}

+ (void)load
{
  [super load];

  // swizzle -[description]
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    Class class = [self class];

    SEL originalSelector = @selector(description);
    SEL swizzledSelector = @selector(doge_description);

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
      class_replaceMethod(class,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  });

  _words = @[
             @"so",
             @"such",
             @"many",
             @"much",
             @"very"
             ];
}

#pragma mark - Accessors

// prevents recursive doge'ing when constructing doge'd string
- (void)doge_setCurrentThreadDogeing:(BOOL)currentThreadDogeing
{
  NSMutableDictionary *threadDictionary = [NSThread currentThread].threadDictionary;
  threadDictionary[IsInDescriptionKey] = @(currentThreadDogeing);
}

- (BOOL)doge_isCurrentThreadDogeing
{
  NSMutableDictionary *threadDictionary = [NSThread currentThread].threadDictionary;
  NSNumber *n = threadDictionary[IsInDescriptionKey];

  return n.boolValue;
}

// prevents double doge-ing
- (void)doge_setAlreadyDoged:(BOOL)alreadyDoged
{
  objc_setAssociatedObject(self, AlreadyDogedKey, @(alreadyDoged), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)doge_isAlreadyDoged
{
  NSNumber *number = objc_getAssociatedObject(self, AlreadyDogedKey);
  return number.boolValue;
}

@end