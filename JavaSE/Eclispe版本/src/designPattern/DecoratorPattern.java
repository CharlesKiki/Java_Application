package designPattern;

/*
 *     例如，我们有一个工具，用于持久化数据的，
 *     最开始设计的功能时是将数据持久化到本地文件，
 *     但现在部分数据需要同时持久化到数据库，再后来，
 *     又有数据需要同时持久化到网络上的位置，
 *     而我们是不能改之前的实现的，因为后面这些需求，
 *     只是针对部分数据的，
 *     所以我们理所当然就可以使用装饰器模式了。
 * 
 * */
public class DecoratorPattern {

}

//被装饰的接口，旧的业务接口
/*
 * 这称之为被装饰者
 * */
interface IPersistentUtil {

	void persistentMsg(String msg);

}

//具体的旧接口
class PersistentUtil implements IPersistentUtil {
	@Override
	public void persistentMsg(String msg) {
		System.out.println(msg + " 存入文件");
	}
}

//装饰者，一个抽象类实现一个接口
abstract class PersistentDecorator implements IPersistentUtil {
	IPersistentUtil iPersistentUtil;
	public PersistentDecorator(IPersistentUtil iPersistentUtil) {
		this.iPersistentUtil = iPersistentUtil;
	}
	@Override
	public void persistentMsg(String msg) {
		iPersistentUtil.persistentMsg(msg);
	}
}

// 装饰--存入数据库
class PersistentDbDecorator extends PersistentDecorator {
	public PersistentDbDecorator(IPersistentUtil iPersistentUtil) {
		super(iPersistentUtil);
	}
	@Override
	public void persistentMsg(String msg) {
		iPersistentUtil.persistentMsg(msg);
		persistentToDb(msg);
	}
	private void persistentToDb(String msg) {
		System.out.println(msg + " 存入数据库");
	}
}

// 装饰--存入网络其他地方

class PersistentNetDecorator extends PersistentDecorator {

	public PersistentNetDecorator(IPersistentUtil iPersistentUtil) {

		super(iPersistentUtil);

	}

	@Override
	public void persistentMsg(String msg) {

		iPersistentUtil.persistentMsg(msg);

		persistentToNet(msg);

	}

	private void persistentToNet(String msg) {

		System.out.println(msg + " 存入网络的其他地方");

	}

}

class DecoratorTestUse {

	public static void main(String args[]) {

		// 被装饰者
		final String data = "数据";

		IPersistentUtil iPersistentUtil = new PersistentUtil();

		iPersistentUtil.persistentMsg(data);

		System.out.println("下面开始装饰，增加数据库持久化功能：");

		//装饰者接受一个被装饰者作为对象
		iPersistentUtil = new PersistentDbDecorator(iPersistentUtil);

		iPersistentUtil.persistentMsg(data);

		System.out.println("下面继续装饰网络存储器持久化：");

		iPersistentUtil = new PersistentNetDecorator(iPersistentUtil);

		iPersistentUtil.persistentMsg(data);

	}

}
