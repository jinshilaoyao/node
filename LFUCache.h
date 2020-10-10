//
//  LFUCache.h
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoubleList.h"
@interface LFUCache : NSObject
- (int)get:(int)key;

- (void)put:(int)key value:(int)value;
@end

