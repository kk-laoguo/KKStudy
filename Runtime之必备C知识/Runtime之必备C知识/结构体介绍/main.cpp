//
//  main.cpp
//  结构体介绍
//
//  Created by zainguo on 2019/6/19.
//  Copyright © 2019 zainguo. All rights reserved.
//

#include <iostream>
struct Student {
    int no;
    char name[20];
    int *age;
    
    Student() {
        no = 110;
        // 数组的一种赋值方式
        stpcpy(name, "zainguo");
        // 分配int空间, 放入20, 并将首地址给指针age
        age = new int(20);
        
    }
};
/*
 *1.定义一个Student1结构体
 */
struct Student1: Student {
    
};
/*
 *2.定义一个结构体变量stu2
 */
struct :Student {
    
}stu2;

/*
 *3.定义一个Student3结构体和一个结构体变量stu3
 */
struct Student3: Student {
    
}stu3;

/*
 *定义一个Student4结构体，并给它取个别名
 struct Student4--->Stu4
 */

typedef struct Student4: Student {
    
}Stu4;


int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
    
    /*
     *访问结构体
     */
    //1.第一种
    struct Student1 stu1;
    printf("stu1 no: %d\n", stu1.no);
    printf("stu1 name: %c%c%c%c%c%c%c\n", *stu1.name, *(stu1.name + 1),  *(stu1.name + 2), *(stu1.name + 3), *(stu1.name + 4), *(stu1.name + 5), *(stu1.name + 6));
    printf("stu1 age: %d\n", *(stu1.age));
    //2.第二种
    printf("stu2 no: %d\n", stu2.no);
    
    //3.第三种
    struct Student3 stu33;
    printf("stu3 no: %d\n", stu3.no);
    printf("stu33 no: %d\n", stu33.no);
    
    //4.第四种
    
    Stu4 stu4;
    struct Student4 stu44;

    printf("stu4 no: %d\n", stu4.no);
    printf("stu44 no: %d\n", stu44.no);
    
    /*
     *结构体指针
     */
    
    Stu4 *pStu4 = &stu4;
    printf("pStu4 -> no: %d\n", pStu4->no);
    /*
     *结构体位域  8位=1字节  4-->0000 0100
     */
    struct Teacher {
        // 无符号int型
        unsigned int a:1;
        unsigned int b:2;
        unsigned int c:3;
        
    }tc, *ptc;
    //打印结果为4字节, 虽然不够只有6位(bte), 一个字节都没有, 但是由于是int型, 所以这里输出为4个字节
    printf("%lu\n", sizeof(Teacher));
    
    ptc = &tc;
    ptc -> a = 1; // 1
    // 0000 0011 = 3
    ptc -> b = 3; // 11
    /// 0000 0111 = 4+2+1 = 7(最大)
    ptc -> c = 5; // 101
    printf("Teacher->a：%u\n",ptc->a);
    printf("Teacher->b：%u\n",ptc->b);
    printf("Teacher->c：%u\n",ptc->c);

    

    
    
    
    

    



    
    
    return 0;
}
