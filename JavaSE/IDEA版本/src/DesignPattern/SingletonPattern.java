package DesignPattern;

public class SingletonPattern {

}
/*
* 饿汉模式
* 这是一个创建型设计模式，意在避免手动New对象
* 优点是不管有没有用到，它在进程初始化完成后就会一直存在
* */
class HungerSingle {
    //默认构造方法
    private HungerSingle(){};
    private static HungerSingle singleObject = new HungerSingle();
    public static HungerSingle getSingleObject(){
        if(singleObject == null){
            singleObject = new HungerSingle();
        }
        return singleObject;
    }
}
/*
* 这种加载使用了懒加载方式
* */
class HungerSingleTest {
    public static void main(String[] args) {
        HungerSingle singleObjectOne = HungerSingle.getSingleObject();
        HungerSingle singleObjectTwo = HungerSingle.getSingleObject();
        System.out.print("对比两个对象是否是同一个对象" + (singleObjectOne == singleObjectTwo));
    }
}
