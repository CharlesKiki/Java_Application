package com.TestPackage;

public class TestPackage{
    public void Hello(){
        System.out.println("Hello,World!");
    }
    /* 使用了Static的方法只能用非实例化的方式来调用 */
    public static void Static_Hello(){
        System.out.println("Hello,This World is from static method!");
    }
}