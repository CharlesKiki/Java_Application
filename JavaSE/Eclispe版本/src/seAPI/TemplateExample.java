package seAPI;

public class TemplateExample {

}

/*
 * 设计Vector需要一个元素和一个对元素操作的模板
 * */

class TestTemplate {
	public static void main(String[] args) {
		// vector<T> v=new vector<T>();
		//0不是Byte类型，要进行类型转换
		Byte b = new Byte((byte) 0);
		vector<Byte> v = new vector<Byte>(b);
		v.add((byte) 0);
		v.add((byte) 1);
		v.add((byte) 3);
		v.add((byte) 2);
		v.visitAll();
	}
}

//模板用方括号表达，其中填写一个类型
//Vector的目的是创建一个用以承载新的类型的容器
class vector<T> {

	private int size = 0;
	private vectorElement<T> head = null;
	private vectorElement<T> last = null;

	//构造方法，接受一个类型，并且一个该类型的值
	public vector(T datum) {
		//System.out.println("vector(T datum)!");
		//模板类型，并且头是一个元素类型
		this.head = new vectorElement<T>(datum);
		this.last = this.head;
		this.size = 1;
	}

	//在自定义Vector中添加一个元素
	public boolean add(T datum) {

		//元素为空
		if (this.size == 0) {
			this.head = new vectorElement<T>(datum);
			this.last = this.head;
			this.size = 1;
		} 
		//元素非空
		else {
			//利用Element模板类可以保存这个值
			vectorElement<T> temp = new vectorElement<T>(datum);
			//保存当前的last值
			temp.previous = this.last;
			//新增加一个值
			this.last.next = temp;
			this.last = temp;
			//容量增加1
			this.size = this.size + 1;
		}
		return true;

	}

	public void visitAll() {
		vectorElement<T> walker;
		walker = head;
		while (walker != null) {
			System.out.println(walker.datum);
			walker = walker.next;
		}
	}
}

class vectorElement<T> {
	
	public vectorElement<T> next = null;
	public vectorElement<T> previous = null;
	
	//保存一个类型的值，并且该类是一个vectorElement<T>类型
	public T datum = null;
	public vectorElement(T datum) {
		this.datum = datum;
	}
}

/*
 * vector(T datum)! 0 0 1 3 2 请按任意键继续. . .
 */