package AdvanceClassExample;

public class InnerOuterClassExample {
}

class OuterClass{
    private String outerVar = "This is the outer string";
    //非静态你声明，这意味着只有在外部类实例化的视情况下
    //内部类才会实例化
    private InnerClass innerClass = new InnerClass();

    //因为内部类是私有的，所以需要用方法返回一个实例
    public InnerClass getInnerClass() {
        return innerClass;
    }

    //测试外部类是否可以访问私有内部类的方法
    public void callInnerClassMethod(){
        innerClass.InnerClassCall();
    }
    //经过实例化的內部类
    class InnerClass {
        void QuoteOuterClassAttributes(){
            //内部类是可以访问外部类的属性的
            String innerTestString = outerVar;
            System.out.println("The outerclass said " + innerTestString);
        }
        void InnerClassCall(){
            System.out.println("I am inner class");
        }
    }
    //不经过实例化的内部类，被静态方法修饰
    static class InnerClassTwo{
        void Call(){
            System.out.println("I am the static inner class.");
        }
    }
}

//整个测试围绕着访问内部类来探索内部类到外部类的关系
class OuterInnerClassTest{
    public static void main(String[] args){
     OuterClass outerClass = new OuterClass();
     //尝试从外部类的对象来访问内部类的对象
        //在这里使用的已经实例化的内部类所以它能执行
     outerClass.callInnerClassMethod(); //I am inner class
        //需要采用外部类的形式来访问内部类
        //而不是使用外部类的实例化对象来访问内部类
     OuterClass.InnerClass innerclass = outerClass.getInnerClass();
        innerclass.QuoteOuterClassAttributes(); //The outerclass said The is the outer string
    }
}

//测试静态修饰下的内部类工作方式
class OuterInnerClassTestTwo{
    public static void main(String[] args){
        //加括号调用没有参数的构造函数，不加括号调用默认构造函数或唯一的构造函数，看需求
        new OuterClass.InnerClassTwo().Call();
    }
}