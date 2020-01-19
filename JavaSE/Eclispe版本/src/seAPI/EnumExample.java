package seAPI;

public class EnumExample {

}

//定义一个星期的枚举类
enum WeekEnum {
	// 显式地列出7个枚举实例(枚举值)，系统会自动添加 public static final 修饰
	// 这个特性意味着每个实例都是单例
	
    // 因为已经定义了带参数的构造器，所以在列出枚举值时必须传入对应的参数
    SUNDAY("星期日"), MONDAY("星期一"), TUESDAY("星期二"), WEDNESDAY("星期三"), 
    THURSDAY("星期四"), FRIDAY("星期五"), SATURDAY("星期六");

    // 定义一个 private 修饰的实例变量
    private String date;

    // 定义一个带参数的构造器，枚举类的构造器只能使用 private 修饰
    private WeekEnum(String date) {
        this.date = date;
    }

    // 定义 get set 方法
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}

/*
 * int compareTo(E o)： 该方法用于与制定枚举对象比较顺序，
 * 同一个枚举实例只能与相同类型的枚举实例比较。
 * 如果该枚举对象位于指定枚举对象之后，
 * 则返回正整数；反之返回负整数；
 * 否则返回零；
 * */
class EnumTest {   
    public static void main(String[] args) {
        System.out.println(WeekEnum.FRIDAY.compareTo(WeekEnum.MONDAY));
        System.out.println(WeekEnum.FRIDAY.compareTo(WeekEnum.SUNDAY));
        System.out.println(WeekEnum.FRIDAY.compareTo(WeekEnum.SATURDAY));
     // 没有重写 toString 方法
        for (WeekEnum we : WeekEnum.values()) {
                    System.out.println(we);
                }
    }
}