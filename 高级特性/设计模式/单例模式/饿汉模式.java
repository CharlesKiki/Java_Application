class Single {
    private static Single s = new Single(); //静态关键字static

    private Single() {                      //私有修饰
    }

    public static Single getSingleObject() {//共有修饰，静态访问关键字
        return s;                           //引用访问，返回对象的地址
    }

}

class Demo {
    public static void main(String[] args) {
        Single s1 = Single.getSingleObject();
        Single s2 = Single.getSingleObject();
        System.out.Println("对比两个对象是同一个对象吗？" + (s1 == s2));    //检查对象是否是同一个

    }
}