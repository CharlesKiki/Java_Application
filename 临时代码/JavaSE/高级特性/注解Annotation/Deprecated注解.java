/**
 * 测试Deprecated注解
 * @author Administrator
 */
public class DeprecatedDemoTest {
    public static void main(String[]args) {
        // 使用DeprecatedClass里声明被过时的方法
        DeprecatedClass.DeprecatedMethod();
    }
}
 
class DeprecatedClass {
    @Deprecated
    public static void DeprecatedMethod() {
    }
}