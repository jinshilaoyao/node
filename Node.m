//
//  Node.m
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import "Node.h"

@implementation Node
- (instancetype)initWithkey:(int)key value:(int)value
{
    self = [super init];
    if (self) {
        self.key = key;
        self.value = value;
    }
    return self;
}
@end
