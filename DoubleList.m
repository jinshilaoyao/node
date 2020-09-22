//
//  DoubleList.m
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import "DoubleList.h"

@interface DoubleList()
@property (nonatomic, strong) Node * head;
@property (nonatomic, strong) Node * tail;
@property (nonatomic, assign) int size;
@end
@implementation DoubleList
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.head = [[Node alloc] initWithkey:0 value:0];
        self.tail = [[Node alloc] initWithkey:0 value:0];
        self.head.next = self.tail;
        self.tail.prev = self.head;
        self.size = 0;
    }
    return self;
}
- (void)addLast:(Node *)node {
    node.prev = self.tail.prev;
    node.next = self.tail;
    self.tail.prev.next = node;
    self.tail.prev = node;
    self.size++;
}
- (void)remove:(Node *)node {
    node.prev.next = node.next;
    node.next.prev = node.prev;
    self.size--;
}
- (Node *)removeFirst {
    
    if (self.head.next == self.tail) {
        return nil;
    }
    Node * first = self.head.next;
    [self remove:first];
    return first;
}
- (int)size {
    return self.size;
}
@end
