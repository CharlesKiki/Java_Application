/* 实际上Package具有很强的目录对应效果，这种路径的自动解析应该是从marven中设定的
同一个Package的源文件互相可见彼此
*/
package com.TestPackage;

public class MyOwnPackage{
    public static void main(String[] args){
        TestPackage SayHello = new TestPackage();
        SayHello.Hello();
        TestPackage.Static_Hello();
    }
}