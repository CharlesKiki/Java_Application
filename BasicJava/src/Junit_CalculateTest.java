import static org.junit.Assert.*;

import org.junit.Test;

import junit.framework.Assert;

public class Junit_CalculateTest {

    
   @Test
   //测试 add()方法
   public void testAdd(){
       Calculator c = new Calculator();
       int result = c.add(1, 2);
       assertEquals(result, 3);
   }
    
   @Test
   //测试 sub()方法
   public void testSub(){
       Calculator c = new Calculator();
       int result = c.sub(2, 1);
       assertEquals(result, 1);
   }
}
