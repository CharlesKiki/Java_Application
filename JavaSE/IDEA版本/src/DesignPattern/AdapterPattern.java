package DesignPattern;

/*
* 对于这个例子中，一个对文件做解析的对象或许需要以单例模式存在
* Object类是所有类的父类，所以任何子类都可以作为参数传入
* */

/*
 * 适配器模式是一个类的不能满足
 * 后用新的自定义接口去实现
 * 目标接口和被适配的对象之间，如果功能完全不同的话，是无法使用此模式的
 * */
public class AdapterPattern {
}

//被适配者
/*
 * 从形式看被适配的可以是一个类
 * 不能被满足的接口可以是它不具备一个方法
 * */
class Adaptee {
    void playMp3(Object src) {
        System.out.println("播放MP3：" + src);
    }
}


//目标，也就是用户所希望使用的
/*
 * 这是应该有的接口类型
 * 接口实际上不需要满足所有的原接口功能
 * 适配器模式的意义就在于创建一个新的接口
 * 这个新的接口和原来的接口没有关系
 * 唯一的变化是增加了功能
 * */
interface Target {
    void playFlac(Object src);
}


//对象适配器
/*
 * 适配器的形式可以是对象，也可以是类
 * 新的对象适配器就是实现自新的接口
 * 使用委托的方法
 * */
class ObjectAdapter implements Target {
    /*
     * 在接口的实现中，可以设定过去的旧接口了
     * 从形式上来看，新的接口的实现是和
     * 老接口保持着依赖关系
     * */
    private Adaptee adaptee;

    /*
     * 构造方法，首先调用父类构造方法
     * 接着实例化旧接口
     * */
    public ObjectAdapter() {
        super();
        adaptee = new Adaptee();
    }

    @Override
    public void playFlac(Object src) {
        //可能需要对src作处理，因为最终提供的功能主体是mp3
        //adaptee.playMp3(src);
        System.out.println("播放Flac：" + src);
    }

    /*
     * 当然也可能这样写，因为Mp3不一定和新的功能有联系
     * */
    public void playMp3(Object src) {
        adaptee.playMp3(src);
    }
}


//类适配器
/*
* 类适配器是继承自旧的接口，实现自新的接口
* 继承只能是单个继承，但是实现却可以是多个实现
* 此处就是需要重写，也就是实现接口的方法
* 对待原有的类则不操作
* */
class ClassAdapter extends Adaptee implements Target {
    /*
    * 此处的写法明显不符合预期
    * 播放MP3：flac
    * */
    @Override
    public void playFlac(Object src) {
        //可能需要对src作处理
        playMp3(src);
    }
}

class AdapterTest{
    public static void main(String args[]){
        //旧的接口无论是类还是对象还是接口的形式都会可以访问
        Adaptee adaptee = new Adaptee();
        //旧功能可以执行
        adaptee.playMp3("mp3");
        //得到一个类适配器
        Target target = new ClassAdapter();
        //类适配器可以正常工作
        target.playFlac("flac");
        //对象适配器初始化
        target = new ObjectAdapter();
        //可以执行对象适配器的功能
        target.playFlac("flac");

        /*
        * 结论：对象适配器和类适配器都是对旧接口的联系
        * 从使用上它们都需要新建对象
        * */
    }
}




