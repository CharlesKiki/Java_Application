
public class NonJunit_CalculatorTest {
    public static void main(String[] args) {
        Calculator c = new Calculator();
        //测试 add()方法
        int result = c.add(1, 2);
        if(result == 3){
            System.out.println("add()方法正确");
        }
         
        //测试 sub()方法
        int result2 = c.sub(2, 1);
        if(result2 == 1){
            System.out.println("sub()方法正确");
        }
         
    }
}
