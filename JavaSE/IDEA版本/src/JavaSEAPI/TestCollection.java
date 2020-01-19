package JavaSEAPI;

import java.util.*;

public class TestCollection {
}

/*
 * Collection接口
 * */

/*
 * — List 有序,可重复
 * */
class TestArrayList {
    public static void main(String args[]) {
        // 创建一个空的数组链表对象list，list用来存放String类型的数据
        // 这里使用了一个没有参数的构造方法
        ArrayList<String> list = new ArrayList<String>();

        // 增加元素到list对象中
        // 默认增加对象到List尾部，也可以通过下标在指定位置插入
        list.add("Item1");
        list.add("Item2");
        list.add(2, "Item3"); // 此条语句将会把“Item3”字符串增加到list的第3个位置。
        list.add("Item4");

        // 显示数组链表中的内容
        System.out.println("The arraylist contains the following elements: " + list);

        // 检查元素的位置
        int pos = list.indexOf("Item2");
        System.out.println("The index of Item2 is: " + pos);

        // 检查数组链表是否为空
        boolean check = list.isEmpty();
        System.out.println("Checking if the arraylist is empty: " + check);

        // 获取链表的大小
        int size = list.size();
        System.out.println("The size of the list is: " + size);

        // 检查数组链表中是否包含某元素
        boolean element = list.contains("Item5");
        System.out
                .println("Checking if the arraylist contains the object Item5: "
                        + element);

        // 获取指定位置上的元素
        String item = list.get(0);
        System.out.println("The item is the index 0 is: " + item);

        // 遍历arraylist中的元素

        // 第1种方法: 循环使用元素的索引和链表的大小
        System.out.println("Retrieving items with loop using index and size list");
        for (int i = 0; i < list.size(); i++) {
            System.out.println("Index: " + i + " - Item: " + list.get(i));
        }

        // 第2种方法:使用foreach循环
        System.out.println("Retrieving items using foreach loop");
        for (String str : list) {
            System.out.println("Item is: " + str);
        }

        // 第三种方法:使用迭代器
        // hasNext(): 返回true表示链表链表中还有元素
        // next(): 返回下一个元素
        System.out.println("Retrieving items using iterator");
        for (Iterator<String> it = list.iterator(); it.hasNext(); ) {
            System.out.println("Item is: " + it.next());
        }

        // 替换元素
        list.set(1, "NewItem");
        System.out.println("The arraylist after the replacement is: " + list);

        // 移除元素
        // 移除第0个位置上的元素
        list.remove(0);

        // 移除第一次找到的 "Item3"元素
        list.remove("Item3");

        System.out.println("The final contents of the arraylist are: " + list);

        // 转换 ArrayList 为 Array
        String[] simpleArray = list.toArray(new String[list.size()]);
        System.out.println("The array created after the conversion of our arraylist is: "
                + Arrays.toString(simpleArray));
    }
}
