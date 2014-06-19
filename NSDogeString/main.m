//
//  main.m
//  NSDogeString
//
//  Created by Adam Bell on 6/18/14.
//  Copyright (c) 2014 Adam Bell. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+Doge.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *manyString = [[NSString stringWithFormat:@"NSString"] dogeString];

    NSString *suchDescription = [[[NSDate date] description] dogeString];

    NSLog(@"%@", manyString);
    NSLog(@"%@", suchDescription);
    NSLog(@"%@", @"swizzled description");
  }
  return 0;
}
