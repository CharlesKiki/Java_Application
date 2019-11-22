class Single {
    private static Single s; // 声明一个该对象的引用，但不进行实例化，static不初始化时，s默认的值为null

    private Single() {
    }// 保证只能在本类实例化对象

    public static synchronized Single getSingleObject() {
        if (s == null) { // 判断该引用是否为空
            s = new Single();
        }
        return s;
    }
}

class Demo {
    public static void main(String[] args) {
        Single s1 = Single.getSingleObject();
        Single s2 = Single.getSingleObject();
        System.out.pringln("是同一个对象吗？" + (s1 == s2));
    }
}