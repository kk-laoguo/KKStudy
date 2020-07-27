//
//  main.c
//  指针介绍
//
//  Created by zainguo on 2019/6/19.
//  Copyright © 2019 zainguo. All rights reserved.
//

#include <stdio.h>

int getMax(int i,int j) {
    return i>j?i:j;
}  

int main(int argc, const char * argv[]) {
    /*
     普通指针
     */
    int a = 4;
    int *pa = &a; //赋值
    printf("a = %d\n", a);
    printf("&a = %p\n", &a);
    printf("pa = %p\n", pa);
    printf("*pa=%d\n",*pa);     //指针取值
    /*
     指针的指针 ppa->pa->a
     */
    int **ppa = &pa;
    printf("&pa = %p\n", &pa);
    printf("ppa = %p\n",ppa);
    printf("*ppa = %p\n",*ppa);
    printf("**ppa = %d\n",**ppa);
    /*
     数组指针
     */
    char b[] = "hello";
    char *bp = b;
    printf("b = %p\n", b);
    printf("pb = %p\n", bp);
    //1.查看每个元素的地址
    for (int i = 0; i < 5; i ++) {
        printf("&b[%d] = %p\n",i, &b[i]);
    }
    //2.用下标取值
    for (int i = 0; i < 5; i ++) {
        printf("b[%d] = %c\n", i, b[i]);
    }
    //3.用指针取值
    for (int i = 0; i < 5; i ++) {
        printf("b[%d] = %c\n", i, *(b + i));
    }

    /*
     函数指针
     */
    int (*p1) (int, int);
    
    
    
    
    
    
    return 0;
}
