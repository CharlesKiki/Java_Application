package DesignPattern;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class FactoryMethodPattern {
}

/*
 * 创建型模式涉及对象的实例化，特点是不让用户代码依赖于对象的创建或排列方式，避免用户直接使用new创建对象。
 * */
class SimpleFactory {

    public static Fruit factory(String str) throws RuntimeException {
        if ("Apple".equals(str)) {
            System.out.println("produce apple");
            /*
             * 从这个得到对象的方式也可以改造成单例模式
             * */
            return new Apple();
        } else if ("Grape".equals(str)) {
            System.out.println("produce grape");
            return new Grape();
        } else {
            throw new RuntimeException("we don't produce such fruit!");
        }
    }
}

/*
 * 工厂模式的形式上有待实例化的类为产品
 * */
class Fruit {

    public void taste() {
    }

    ;

    public void color() {
    }

    ;
}

class Apple extends Fruit {

    public void taste() {
        System.out.println("I'm Sweet");
    }

    public void color() {
        System.out.println("I'm Red");
    }
}

class Grape extends Fruit {

    public void taste() {
        System.out.println("I'm Sour");
    }

    public void color() {
        System.out.println("I'm Purple");
    }
}

class Test {
    public static void main(String[] args) {
        try {
            SimpleFactory.factory("Apple").color();
            SimpleFactory.factory("Grape").color();
            SimpleFactory.factory("Orange").color();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

/*
 * 联想：Collection的遍历器
 * 迭代器解决的痛点是相比于基础数据类型的循环遍历，抽象形式的类不容易再用for
 * 进行遍历，故而类自身提供一个内部类来帮助在for中进行循环和输出
 * */


//方便演示而实现的简陋的数组list
/*
 * ArrayList用以存放T类型的对象
 * 在遍历的时候通过迭代器这个类来访问集合，这样就通过形式上的访问迭代器而遍历了集合
 * 在这里迭代器返回的就是产品，迭代器就是工厂。
 * 区别在于在工厂模式中，工厂往往是需要继承和声明的，而这里集合中的对象则成了现成的产品。
 * */
class ArrayList<T> implements List<T> {

    private int size; //存放的元素个数,会默认初始化为0

    //这是一个Object数组
    private Object[] defaultList; //使用数组存放元素

    private static final int defaultLength = 10;//默认长度

    public ArrayList() { //默认构造函数

        /*
        * 创建一个数组的方式可以是new
        * */
        defaultList = new Object[defaultLength];

    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public boolean contains(Object o) {
        return false;
    }

    /*
     * 返回的类型是一个迭代器类型，但是返回所调用的方法是自定义继承的迭代器方法
     * */
    @Override
    public Iterator<T> iterator() {
        return new MyIterator();
    }

    @Override
    public Object[] toArray() {
        return new Object[0];
    }

    @Override
    public <T1> T1[] toArray(T1[] a) {
        return null;
    }

    //添加元素
    @Override
    public boolean add(T t) {

        if (size <= defaultLength) {

            defaultList[size++] = t;

            return true;

        }

        return false;

    }

    @Override
    public boolean remove(Object o) {
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean addAll(Collection<? extends T> c) {
        return false;
    }

    @Override
    public boolean addAll(int index, Collection<? extends T> c) {
        return false;
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        return false;
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        return false;
    }

    @Override
    public void clear() {

    }

    @Override
    public T get(int index) {
        return null;
    }

    @Override
    public T set(int index, T element) {
        return null;
    }

    @Override
    public void add(int index, T element) {

    }

    @Override
    public T remove(int index) {
        return null;
    }

    @Override
    public int indexOf(Object o) {
        return 0;
    }

    @Override
    public int lastIndexOf(Object o) {
        return 0;
    }

    @Override
    public ListIterator<T> listIterator() {
        return null;
    }

    @Override
    public ListIterator<T> listIterator(int index) {
        return null;
    }

    @Override
    public List<T> subList(int fromIndex, int toIndex) {
        return null;
    }

    //遍历器（具体产品）
    /*
    * 一个私有类，在类的内部仍然可以继续声明类，并且这个类也不一定是静态的
    * */
    private class MyIterator implements Iterator<T> {

        private int next;

        @Override

        public boolean hasNext() {

            /*
            * 这是一个表达式，当next < size时返回1否则返回0
            * */
            return next < size;

        }

        /*
        * 并没有进行下标的检查
        * */
        @SuppressWarnings("unchecked")
        @Override
        public T next() {

            /*
            * next方法返回一个T类型对象
            * 将数组内存储的元素强制类型转换为T类型
            * */
            return (T) defaultList[next++];

        }

    }
}


class FactoryPatternTestUse {

    public static void main(String args[]) {

        //分别定义两种结构
        //Int类型的装箱形式
        List<Integer> array = new ArrayList<Integer>();

        //添加数据
        /*
        * 这里添加的数据是int类型的数据
        * */
        for (int i = 1; i < 8; i++) {
            array.add(i);
        }

        //获得迭代器
        Iterator<Integer> ai = array.iterator();

        //遍历并输出

        while (ai.hasNext())
            /*
            * 这里的输出实际上是使用了int类型的装箱类型的print
            * */
            System.out.print(ai.next());
    }

}

