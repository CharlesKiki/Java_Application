package AdvanceClassExample;
//静态导入，包名，对象名，方法
import static java.lang.System.out;

//经过final修饰的类无法被继承
public final class FinalVar {
}

class FinalVarTest {
    public static void main(String[] args) {
        //常量的规范命名是全部大写
        final double PI = 3.14;
        /*
        * Final还可以修饰对象，基本数据类型，其中
        * 数组也是被看作一个对象
        * */
        final FinalClass testFinalClass = new FinalClass();
        //编译器报错，无法为Final类型的变量赋值
        //testFinalClass = new FinalClass();
        testFinalClass.name = "A Attributes class with final can be changed";
        System.out.println(testFinalClass.name);

        /*
        * final修饰数组无法重新改变引用，但是可以改变其中的值，这一点对于
        * 对象也是一样的
        * */
        final int[] array = {1,2,3,4,5,6,7,8,9,0};
        for(int index = 0;index < array.length;index++){
            array[index] = 10;
            System.out.println(array[index]);
        }
        /*
        * 使用Final和Static进行修饰的变量将会形成全局常量
        * Static关键词同样以与import关键字结合使用
        * 利用import static 可以不通过调用包名和对象，直接使用包里的静态方法
        * */
        out.println("利用静态导入的效果");

    }
}

class FinalClass{
    String name;
    public void call(){
        System.out.println("I am Final class");
    }
}

/*
* 只有在接口中使用这样的修饰方法
* 为什么接口中的常量必须使用public static final修饰
    public: 使接口的实现类可以使用这个常量
    static：static修饰就表示它属于类的，随的类的加载而存在的，如果是非static的话，
    就表示属于对象的，只有建立对象时才有它，而接口是不能建立对象的，所以
    接口的常量必须定义为static
    final：final修饰就是保证接口定义的常量不能被实现类去修改，如果没有final的话，
    由子类随意去修改的话，接口建立这个常量就没有意义了。
* */
interface PublicFinalStaticTest{
    public static final int CONSTANCE = 1;
    //接口中的函数不能有函数体，也就是花括号
    //接口中的方法不能被修饰为final或者private，这样就会无法实现
    void call();
}

class ClassAsInterfaceExample{
    //类中的方法可以使用private和final修饰
    //使用final方法的原因是把方法锁定，以防任何继承类修改它的含义。
    //同时如果父类中的这个方法使用了private那么在子类也是不能重写这个方法
    private final void call(){};
}
