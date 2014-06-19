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

@implementation NSString (doge)

static NSArray *_words;
static NSArray *_otherWords;

- (NSString *)dogeString
{
  return [NSString stringWithFormat:@"%@ %@.%@",
          _words[arc4random() % (_words.count - 1)],
          self,
          arc4random() % 2 ? @" wow." : @""];
}

+ (void)load
{
  [super load];
  _words = @[
             @"so",
             @"such",
             @"many",
             @"much",
             @"very"
             ];
}

@end