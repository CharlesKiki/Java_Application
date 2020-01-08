package AdvanceClassExample;

/*
 * 这意味着一个类继承自多个不同的类
 * */
public class MultipleInheritance {
}

/*
 * 多层继承实现多继承
 * 缺点是注意这种方法复写
 * */

//父类A类
/*
 * 实现功能：打印，属性
 * */
class A {
    private int num = 10;

    public int getNum() {
        return this.num;
    }

    public void fun() {
        System.out.println("你今天真好看！");
    }
}

//B类继承A类
/*
 * 新增字段
 * 增加方法
 * */
class B extends A {
    private String name = "张三";

    public String getName() {
        return "B类" + this.name;
    }

    //父类私有域被继承但不可直接使用，需通过getter方法间接获得私有域的内容
    //方法覆写
    //可读性提高
    //编译器会校验写的方法在父类中是否存在
    @Override
    public void fun() {
        //调用父类的方法
        System.out.println("这里是类访问父类方法" + this.getNum());
    }
}

//C类继承B类，相当于间接继承A类
class C extends B {
    //注意在继承的时候会复写对应的属性和方法
    private String name = "刘能";


    public String getName() {
        return "C类" + this.name;
    }

    //方法覆写（结果为覆写后的内容，即现在的属性和方法都是C类的）
    public void fun() {
        System.out.println("这里是C类调用C类字段" + this.getName());
        System.out.println("这是C类的属性" + this.name);
    }
}

class MultipleInheritanceTest {
    public static void main(String[] args) {
        //初始化最初的父类
        A a = new A();
        //调用父类方法
        a.fun();

        //向上转型（优点在于子类可自动进行向上转型，可实现参数的统一）
        //所谓的向上转型就是子类的可以当作父类类型传递
        print(new B());
        print(new C());
    }

    /*
     * 注意该方法是一个父类为对象
     * */
    public static void print(A a) {
        //执行该形参的方法
        a.fun();
    }
}


//内部类实现多继承
/*
* 多继承的核心灵魂是一个新的类可以访问旧的
* */
class SecondA {
    private int num = 10;
    public int getNum() {
        return this.num;
    }

    public void fun() {
        System.out.println("你今天真好看！");
    }
}

class SecondB {//B类（与A类无关）
    private String name = "张三";

    public String getName() {
        return this.name;
    }

    public void fun() {
        System.out.println("昨天的你也很好看!");
    }
}

class SecondC {//C类

    // private String name="刘能";
    //C中内部类继承A类
    class OneA extends SecondA {

        public void printA() {
            System.out.println(this.getNum());
            fun();
        }
    }

    class OneB extends SecondB {//C类内部类继承B类

        public void printB() {
            System.out.println(this.getName());
            fun();
        }
    }
    //在C类中生成普通方法print()
    //匿名实例化OneA类对象并调用printA方法
    public void print() {
        new OneA().printA();
        new OneB().printB();
    }
}

class SecondTest {
    public static void main(String[] args) {
        /*
        * 内部类实现多继承的形式是，一个新的类可以
        * 无障碍的访问到过去的类
        * */
        SecondC c = new SecondC();//实例化C类对象
        c.print();//调用C中print方法
    }
}



//接口实现多继承
interface IA{//父接口A（接口为更纯粹的抽象类，结构组成只含全局常量和抽象方法）
    void funA();
}
interface IB{//父接口B（接口前添加I用以区分接口）
    void funB();
}
//接口可继承多个父接口，用,分隔开即可，
// 子接口的命名可选择较为重要的父接口进行命名或自行命名，
// 一般子接口后添加Impl用以区分
interface CImpl extends IA,IB{
    void funC();
}
//定义类实现接口（也可直接实现父接口（多个））
class Impl implements CImpl{
    //抽象方法的实现
    public void funC(){
        System.out.println("你昨天真好看！");
    }
    public void funA(){
        System.out.println("你今天真好看！");
    }
    public void funB(){
        System.out.println("你明天真好看!");
    }
}
class ThirdTest{
    public static void main(String[] args){
        //实例化对象
        Impl im=new Impl();
        im.funA();
        im.funB();
        im.funC();
    }
}

//某种程度上，如果认为方法或者属性的增多就是继承的后果
//那么又继承又实现，一定是多重继承了