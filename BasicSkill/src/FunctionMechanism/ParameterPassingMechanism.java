package FunctionMechanism;


import java.util.concurrent.atomic.AtomicInteger;

public class ParameterPassingMechanism {
    public static void main(String args[]) {

    }
}

//用Java实现swap函数，交换两个整数类型的值

class  SwapExampleOne{
    static void swap(int a, int b){
        int temp = a;
        a = b;
        b = temp;
    }
    public static void main(String[] args){
        int a = 1, b=2;
        swap(a,b);
        System.out.print("a="+ a + ", b="+ b);
    }
    /*
    * 这个方法是错误的，结果为a=1, b=2
    * 错误的原因是这是一个值传递参数，所以不会改变原变量的值
    * */
}

class SwapExampleTwo{
    public static void main(String[] args){
        Integer a = 1, b = 2;
        swap(a,b);
        System.out.print("a="+ a + ", b="+ b);
    }
    static void swap(Integer a, Integer b){
        Integer temp = a;
        a = b;
        b = temp;
    }
    /*
    * 以两个装箱类型仍然不能交换属性值，尽管对对象的引用是指针引用
    * */
}

/*
* AtomicIntegerSDK提供的一种用于多线程安全的类型。但是AtomicInteger类型和普通的Integer类型并不相同
 * */

/*
class SwapExampleThree {
    void swap(Integer a, Integer b) {
        AtomicInteger temp = a;
        a = b;
        b = temp;
    }
    public static void main(String[] args) {
        AtomicInteger a = 1, b = 2;
        swap(a, b);
        System.out.print("a=" + a + ", b=" + b);
    }

}*/

/*
* Java中的装箱类型和基本数据类型不同之处的一个特征就是它具有类的方法，并非单纯的存储数据
* 于是在CPP中引用传递可以使用&和*方便的做取值和取指的操作，得以直接修改两个变量的值
* 而在Java中则需要使用对象的内置方法才可以
* 也就是说使用引用先引用对象，然后再使用值的操作
* */
class SwapExampleFour{
    public static void main(String[] args){
        /*
        * 一种错误的写法，可能会导致未初始化错误
        * Type one:AtomicInteger a,b;
        * Type two:AtomicInteger a = null,b =null;
        * 其中第二种错误会导致空指针错误
        * */
        AtomicInteger a= new AtomicInteger();
        AtomicInteger b= new AtomicInteger();
        a.getAndSet(1);
        b.getAndSet(2);
        swap(a,b);
        System.out.print("a="+ a + ", b="+ b);
    }
    static void swap(AtomicInteger a, AtomicInteger b){
        int temp = a.get();
        a.getAndSet(b.get());
        b.getAndSet(temp);
    }
}