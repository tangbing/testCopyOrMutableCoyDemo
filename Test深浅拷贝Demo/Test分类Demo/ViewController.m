//
//  ViewController.m
//  Test分类Demo
//
//  Created by Tb on 2020/8/12.
//  Copyright © 2020 Tb. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (nonatomic, strong)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    [self testStrongOrcopy];
    
    

    [self testMutableArray];
}


- (void)testStrongOrcopy {
    

    /*
     >1.用stong修饰的self.array，
     NSMutableArray赋值给了array，然后修改了，self.array会跟着变，不安全
     >1.用copy修饰的self.array，
     NSMutableArray赋值给了array，然后修改了，self.array会复制一个副本，不会改变原有值，比较安全
     
     */
  
    NSMutableArray *mutableArray = [NSMutableArray array];

       [mutableArray addObject:@"1"];
       [mutableArray addObject:@"2"];

       self.array = mutableArray;

       NSLog(@"array0:%@,array0:%p",self.array,self.array);
       
       [mutableArray addObject:@"3"];


       
       NSLog(@"array1:%@,array1:%p",self.array,self.array);

}


- (void)testMutableArray {
    
    /*
    结论：对集合对象mutableCopy操作操作：
       >对可变对象/不可变对象 mutableCopy，内存地址发生变化，内容拷贝，是深拷贝

    */
    NSMutableArray *mutablearray = [NSMutableArray arrayWithObjects:@"1",@"2",nil];
    NSLog(@"原始mutablearray的地址:%p,值为:%@",mutablearray,mutablearray);
    
    NSMutableArray *copyArray = [mutablearray mutableCopy];
    NSLog(@"拷贝mutablearray的地址:%p,值为:%@",copyArray,copyArray);
    
    
    NSArray *array = @[@1,@2,@3];
    NSLog(@"原始array的地址:%p,值为:%@",array,array);

    NSArray *coArray = [array mutableCopy];
    NSLog(@"原始coArray的地址:%p,值为:%@",coArray,coArray);


}

- (void)testArray {
    
    /*
    结论：对集合对象copy操作操作：
       >1.对可变对象copy，内存地址发生变化，内容拷贝，是深拷贝
       >1.对不可变对象copy，内存地址没发生变化，指针拷贝，是浅拷贝

    */
    NSMutableArray *mutablearray = [NSMutableArray arrayWithObjects:@"1",@"2",nil];
    NSLog(@"原始mutablearray的地址:%p,值为:%@",mutablearray,mutablearray);
    
    NSMutableArray *copyArray = [mutablearray copy];
    NSLog(@"拷贝mutablearray的地址:%p,值为:%@",copyArray,copyArray);
    
    
    NSArray *array = @[@1,@2,@3];
    NSLog(@"原始array的地址:%p,值为:%@",array,array);

    NSArray *coArray = [array copy];
    NSLog(@"原始coArray的地址:%p,值为:%@",coArray,coArray);


}

/*
   结论：对非集合对象copy操作操作：
      >1.对可变对象copy，内存地址发生变化，内容拷贝，是深拷贝
      >1.对不可变对象copy，内存地址没发生变化，指针拷贝，是浅拷贝

   */

- (void)testStrig {
    NSLog(@"testPrint");
    
    NSMutableString *mutabString = [NSMutableString stringWithFormat:@"name"];
    NSLog(@"原始string的地址:%p",mutabString);

    NSMutableString *copyString = [mutabString copy];
    NSLog(@"拷贝string的地址:%p",copyString);

   // [copyString appendFormat:@"aaa"];
    
    NSString *string = [NSString stringWithFormat:@"aaa"];
    NSLog(@"原始string的地址:%p",string);
    NSString *copyStr = [string copy];
    NSLog(@"拷贝string的地址:%p",copyStr);

    
    
}


@end
