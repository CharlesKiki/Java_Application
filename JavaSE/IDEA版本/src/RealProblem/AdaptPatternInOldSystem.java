package RealProblem;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Vector;

/*
* 该例子使用到了迭代器本身可以被适配，因为迭代器可能需要从一个容器转化为另一个
* 一个团队的开发容器可能是一个，另一个团队开发的功能则是另一个，如此
* 便出现了拼接的时候需要完成迭代器转化
*
* 使用BookAdapter核心目的是它是个多重继承，它既有旧类的功能
* 又添加了需要的内容
*
* */

public class AdaptPatternInOldSystem {
}


//被适配者
/*
* 如果我们要扩展一个老系统：一个用于存放书名的类，
* 这个系统采用的Vector作为容器，而且Vector使用Enumeration来遍历容器。
* 但现在，我们其他模块没沟通清楚以为那个类使用的LinkedList来实现，
* 使用的时候用的Iterator，
* 这时，我们就需要适配器，具体描述见下面的代码：
* */
class Book {
    //注意这里使用的容器是Vector
    private Vector<String> books;
    //构造函数
    public Book() {
        books = new Vector<String>();
    }
    public void add(String book) {
        books.add(book);
    }

    /*
    * 注意返回的类型
    * 该方法随后被重新
    * 该方法名为getEnum()
    * */
    public Enumeration<String> getEnum() {
        return books.elements();
    }
}


//适配器，目标就是Iterator，被适配者是Enumeration
//意思就是从Enumeration类型转换到Iterator遍历
//Iterator适配器（对象适配器）
//这里用到的适配器思想是IteratorAdapter实现了Iterator<String>
//也就是原本的Iterator<String>功能不够用，因为此处是Enumeration转换来的
//普通的Iterator不具备这个功能
class IteratorAdapter implements Iterator<String> {
    Enumeration<String> myEnum;
    public IteratorAdapter(Enumeration<String> myEnum) {
        this.myEnum = myEnum;
    }

    @Override
    public boolean hasNext() {
        return myEnum.hasMoreElements();
    }

    @Override
    public String next() {
        return myEnum.nextElement();
    }

}


//适配器
/*
* 此处实际上是一个多重继承
* 对于实现来说，它获得了迭代器接口，并且利用这个接口实现了
* 第二次的适配器，间接迭代器实现了适配核心的容器转换功能
* */
class BookAdapter extends Book implements Iterable<String> {
    /*
    * 相当于把原来的遍历方法重写了
    * 这里很巧妙，需要的是Iterator<String>类型
    * 返回的是IteratorAdapter(getEnum())
    * */
    @Override
    public Iterator<String> iterator() {
        return new IteratorAdapter(getEnum());
    }
}

/*
* 这两者显然是冲突的，为了解决，我们需要添加适配器，
* 首先要把Enumeration的行为转换为Iterator，
* 然后还需要添加一个Book的适配器（所以，这里是用到了2次适配器的）
* */
class TestUse {
    /*
    * BookAdapter，适配器常常成为原来类的替代者
     * */
    public static void main(String args[]) {
        //在原本的双方有矛盾的使用方式
        //使用Bookadapter意味着向上转型
        //这里使用的签名是父类
        //Book books = new BookAdapter();

        /*
        * 这里实际上BookAdapter是一个Book类
        * 具有Book类的方法
        * 这里使用的签名是适配器
        * */
        BookAdapter books = new BookAdapter();
        //使用其父类的方法
        books.add("think in java");
        books.add("c++ primer");
        books.add("伊索寓言");
        //iterator这个概念的全部意义在于方便的遍历全部对象
        /*
        * 注意此处，真正的编程目的是其中一个开发者使用Iterator<String>
        * 现在已经成功从books得到迭代器
         * */
        Iterator<String> iterator = books.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}

/*
* 签名的不同似乎意味着对象的方法也有区别 但是是什么区别？
* 继承又实现，意味着这个类其实是多呈继承
* */

