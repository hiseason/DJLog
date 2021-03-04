//
//  DJBlock.m
//  DJLog
//
//  Created by 郝旭姗 on 2021/3/3.
//

#import "DJBlock.h"
#import "DJPerson.h"

@implementation DJBlock

__weak id person
+ (void)execute {
    DJBlock *block = [[DJBlock alloc] init];
    [block capture];
}

- (void)capture {
    DJPerson *person1 = [[DJPerson alloc] init];
    person1.name = @"Mike";
    __block DJPerson *person2 = [[DJPerson alloc] init];
    person2.name = @"Sean";
    __block int vi = 1;
    void(^handler)(NSString *)= ^(NSString *name){
        person1.name = name;
        person2.name = name;
        vi = 2;
    };
    handler(@"Lucy");
    NSLog(@"%@",person1.name);
    NSLog(@"%@",person2.name);
    NSLog(@"%i",vi);
}

@end
