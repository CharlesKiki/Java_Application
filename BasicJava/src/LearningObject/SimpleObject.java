
public class SimpleObject{
   int int_variable;
   public SimpleObject(String input_string){
      // 这个构造器仅有一个参数：name
      System.out.println("Your input is : " + input_string ); 
   }
 
   public void set_attribute( int int_var ){
      int_variable = int_var;
   }
 
   public int get_attribute( ){
       System.out.println("Value is : " + int_variable ); 
       return int_variable;
   }
 
   public static void main(String []args){
      /* 创建对象 */
	   SimpleObject myObject =  new SimpleObject( "FirstObject" );
      /* 通过方法来设定age */
      myObject.set_attribute( 1000 );
      /* 调用另一个方法获取age */
      myObject.get_attribute( );
      /*你也可以像下面这样访问成员变量 */
      System.out.println("The value is : " + myObject.int_variable ); 
   }
}
