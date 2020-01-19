package DesignPattern;

public class TemplatePattern {
}

// 抽象模板
/* 
    从形式上看一个抽象模板是一个抽象类
*/
abstract class AbstractTemplate {
    //模板的设计也可以包含数据
    Object data;

    //模板方法也就是定义方法的接口
    void dealData() {
        getData();
        calcData();
        printData();
    }

    // 下面是普通方法，可能已经实现，也可能需要子类实现
    abstract void getData();
    abstract void calcData();
    void printData() {
        System.out.println(data);
    }
}

// 具体模板是一个继承并实现模板的类
class Template extends AbstractTemplate {
    //重写方法Annotation
    @Override
    void getData() {
        data = "data";
    }

    @Override
    void calcData() {
        data = "The implement method result is : "+ data;
    }
}

class TestUse {
    public static void main(String args[]) {
        Template template = new Template();
        template.dealData();
    }
}
