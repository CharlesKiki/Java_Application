package ConstructorsInheritanceExample;

public class ConstructureExample {
}

/*
* 每个类都会有一个无参数的构造方法
* 如果显式的声明了此方法，则会覆盖
* */
class Animal {
    private String name;
    public Animal() {
        this.name = "这是无参的构造方法";
    }
    public Animal(String name) {
        this.name = name;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }

}

/*
*
* */
class Dog extends Animal {
    //当你没有使用父类默认的构造方法时，此时在子类的构造方法中就需要显式的调用父类定义的构造方法。
    //这时你就要显示的调用父类的构造方法，因为子类默认调用的是父类的无参构造方法Animal()
    public Dog() {
        //显示调用父类的有参构造方法
        super("小狗Dog");
        //.... //子类的构造方法处理
    }

    /*public Dog(String name){
        this.name = name;
    }*/
}

class ConstructorTest{
    public static void main(String[] args){
        /*
        * 使用TryCatch的原因是这帮助诊断错误和缩小错误检查范围
        * */
        try{
            /*
            * 无论是有参数的还是无参数的构造方法，如果调用则必须有对应的
            * 构造方法
            * */
            //此时调用的是类的无参构造方法
            Animal animalTestNoArameters = new Animal();
            //此时调用的是类的有参构造方法
            Animal animalTestArameters   = new Animal("这是有参数的构造方法");
            System.out.println("无参数的构造结果：" + animalTestNoArameters.getName());
            System.out.println("有参数的构造结果：" + animalTestArameters.getName());
        }catch (Exception e){
            throw e;
        }
        Dog DogTest = new Dog();
        /*
        * 子类虽然没有重写父类的方法，但是它依然是可以直接调用的
        * */
        System.out.println("无参数的子类构造结果：" + DogTest.getName());

    }
}