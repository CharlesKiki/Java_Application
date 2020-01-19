package designPattern;

public class BridgePattern {

}
/*
 * 该模式的灵魂是抽象接口和抽象接口的应用
 * */

// 桥接模式
class SimpleBridge {
	public static void main(String args[]) {
		//该模式的核心是两个产品都是继承自抽象接口
		//抽象配合抽象 = N * N种产品组合
		new LenevoComputer(new Amd()).discribe();
		new HaseeComputer(new Intel()).discribe();
	}
}

// 实现者
interface Cpu {
	String discribe();
}

// 具体实现者
class Amd implements Cpu {
	public String discribe() {
		return "just so so...";
	}
}

// 具体实现者
class Intel implements Cpu {
	public String discribe() {
		return "great !";
	}
}

// 抽象产品
abstract class AbstractComputer {
	Cpu cpu;

	public AbstractComputer(Cpu cpu) {
		this.cpu = cpu;
	}

	public abstract void discribe();
}

// 细化产品抽象
class LenevoComputer extends AbstractComputer {
	public LenevoComputer(Cpu cpu) {
		super(cpu);
	}

	@Override
	public void discribe() {
		System.out.println("联想笔记本cpu:" + super.cpu.discribe());
	}
}

// 细化产品抽象
class HaseeComputer extends AbstractComputer {
	public HaseeComputer(Cpu cpu) {
		super(cpu);
	}

	@Override
	public void discribe() {
		System.out.println("神舟笔记本cpu:" + super.cpu.discribe());
	}
}// 输出：联想笔记本cpu:just so so... 神舟笔记本cpu:great !



// 定义数据存储的实现
// 实现
interface ISaveData {
	void save(Object data);
}

// 具体实现

class SaveToFile implements ISaveData {
	@Override
	public void save(Object data) {
		System.out.println(data + " 存储到文件");
	}
}

// 具体实现
class SaveToDB implements ISaveData {
	@Override
	public void save(Object data) {
		System.out.println(data + " 存储到数据库");
	}
}

// 抽象
abstract class AbstractSave {
	ISaveData saveData;

	public AbstractSave(ISaveData saveData) {
		this.saveData = saveData;
	}

	public void save(Object data) {
		// TODO 自动生成的方法存根

	}

	public abstract void save();
}

// 细化抽象
class LocalSave extends AbstractSave {
	public LocalSave(ISaveData saveData) {
		super(saveData);
	}

	// 重载也是要重载的
	public void save(Object data) {
		System.out.print("本地存储：");
		saveData.save(data);
	}

	// 抽象方法实现是要实现的
	public void save() {
		// TODO 自动生成的方法存根

	}
}

// 细化抽象

class NetSave extends AbstractSave {

	public NetSave(ISaveData saveData) {

		super(saveData);

	}

	public void save(Object data) {

		System.out.print("网络存储：");

		saveData.save(data);

	}

	//抽象方法的实现就是覆盖
	@Override
	public void save() {
		// TODO 自动生成的方法存根
		
	}

}

class TestUse {

	public static void main(String args[]) {
		Object data = "数据";
		ISaveData saveDataDb = new SaveToDB();
		ISaveData saveDataFile = new SaveToFile();
		AbstractSave save;
		save = new NetSave(saveDataDb);
		save.save(data);
		save = new LocalSave(saveDataDb);
		save.save(data);
		save = new LocalSave(saveDataFile);
		save.save(data);
	}
}
