package com.accessmodifier;
public class finalexample {
   final int value = 10;
   // 下面是声明常量的实例
   /* 
      在Finale的修饰下必须初始化一个值
      并且无法改动
   */
   public static final int BOXWIDTH = 6;
   static final String TITLE = "Manager";

   public void changeValue() {
      //value = 12; // 将输出一个错误,无法编译
   }
   public static void main(String[] args) {
      System.out.print("The final value is " + TITLE);
   }
}