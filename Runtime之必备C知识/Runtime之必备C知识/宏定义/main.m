//
//  main.m
//  宏定义
//
//  Created by zainguo on 2019/6/24.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 *1.宏定义常量
 */
#define  PI 3.141592654          //自动识别成double

/*
 *2.宏定义方法
 */
#define swap(x, y)\
x = x + y;\
y = x - y;\
x = x - y\

/*
 *3.宏定义一段代码
 */

#define LOG\
    int a = 4;\
    int b = 5;\
    printf("a：%d\n",a);\
    printf("b：%d\n",b)

#ifndef A           //是否没有宏定义A
#define A 1
#endif              //判断结束


//#define B 2

//#undef A //取消宏定义A



int main(int argc, const char * argv[]) {
    
    
    printf("PI：%.9lf\n",PI);

    int x = 10;
    int y = 20;
    swap(x, y);
    printf("交换之后：x=%d,x=%d\n",x,y);
    LOG;
    printf(" a: %d\nb：%d\n",a,b);
    
#ifdef A
    printf("A: %d\n", A);
#elif B
    printf("B: %d\n", B);
#else
    printf("no define!\n");

#endif

    return 0;
}
