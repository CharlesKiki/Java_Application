
public class SimpleObject{
   int int_variable;
   public SimpleObject(String input_string){
      // �������������һ��������name
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
      /* �������� */
	   SimpleObject myObject =  new SimpleObject( "FirstObject" );
      /* ͨ���������趨age */
      myObject.set_attribute( 1000 );
      /* ������һ��������ȡage */
      myObject.get_attribute( );
      /*��Ҳ�����������������ʳ�Ա���� */
      System.out.println("The value is : " + myObject.int_variable ); 
   }
}
