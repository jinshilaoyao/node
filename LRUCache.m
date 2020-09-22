//
//  LRUCache.m
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import "LRUCache.h"
@interface LRUCache()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *,Node *>* map;
@property (nonatomic, strong) DoubleList * cache;
@property (nonatomic, assign) int cap;
@end
@implementation LRUCache
- (instancetype)initWithCap:(int)cap
{
    self = [super init];
    if (self) {
        self.cap = cap;
        self.map = [NSMutableDictionary dictionaryWithCapacity:cap];
        self.cache = [[DoubleList alloc] init];
    }
    return self;
}

- (int)get:(int)key {
    if (![self.map.allKeys containsObject:@(key)]) {
        return -1;
    }
    [self makeRecently:key];
    return self.map[@(key)].value;
}
- (void)put:(int)key value:(int)value {
    if ([self.map.allKeys containsObject:@(key)]) {
        [self deleteKey:key];
        [self addRecently:key value:value];
        return;
    }
    if (self.cap == self.cache.size) {
        [self removeLeastRecently];
    }
    [self addRecently:key value:value];
}
- (void)makeRecently:(int)key {
    Node * node = self.map[@(key)];
    [self.cache remove:node];
    [self.cache addLast:node];
}
- (void)addRecently:(int)key value:(int)value {
    Node * node = [[Node alloc] initWithkey:key value:value];
    [self.cache addLast:node];
    [self.map setValue:node forKey:@(key)];
}
- (void)deleteKey:(int)key {
    Node * node = self.map[@(key)];
    [self.cache remove:node];
    [self.map removeObjectForKey:@(key)];
}
- (void)removeLeastRecently {
    Node * node = [self.cache removeFirst];
    int key = node.key;
    [self.map removeObjectForKey:@(key)];
}
@end
