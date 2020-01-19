package designPattern;

import java.util.Arrays;

public class IteratorPattern {

}

// 集合接口
interface MyList<T> {

	MyIterator<T> iterator(); 			// 返回一个遍历器
	boolean add(T t); 					// 添加元素到列表
	T get(int index); 					// 得到元素
	T remove(); 						// 删除最后一个元素
	boolean remove(T element); 			// 删除指定元素
	T remove(int index); 				// 删除指定位置元素
	boolean set(int index, T element); 	// 修改指定位置值
	int size();
	
}

class MyArrayList<T> implements MyList<T> {

	private int size; 								// 存放的元素个数,会默认初始化为0
	private Object[] defaultList; 					// 使用数组存放元素
	private static final int defaultLength = 10;	// 默认长度
	public MyArrayList() { 							// 默认构造函数
		defaultList = new Object[defaultLength];
	}
	
	@Override
	public MyIterator<T> iterator() {
		return new Iterator();
	}
	// 大小自动增长
	private void ensureCapacity(int capacity) {
		int nowLength = defaultList.length;
		if (capacity >= nowLength) {
			nowLength = nowLength + (nowLength >> 1);
			if (nowLength < 0)// 溢出
				nowLength = Integer.MAX_VALUE;
			defaultList = Arrays.copyOf(defaultList, nowLength);
		}
	}

	// 添加元素
	@Override
	public boolean add(T t) {
		ensureCapacity(size + 1);
		defaultList[size++] = t;
		return true;
	}

	// 获取元素
	@SuppressWarnings("unchecked")
	@Override
	public T get(int index) {
		if (index < 0 || index >= size)
			return null;
		return (T) defaultList[index];
	}

	@Override
	public T remove() {
		return remove(size - 1);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T remove(int index) {
		if (index < 0 || index >= size)
			return null;
		T element = (T) defaultList[index];
		if (index != size - 1)
			System.arraycopy(defaultList, index + 1, defaultList, index, size - index - 1);
		size--;
		return element;
	}

	@Override
	public boolean remove(T element) {
		if (element == null) {
			for (int i = 0; i < size; i++)
				if (defaultList[i] == null) {
					System.arraycopy(defaultList, i + 1, defaultList, i, size - i - 1);
					size--;
					return true;
				}
		}
		else {
			for (int i = 0; i < size; i++)
				if (defaultList[i].equals(element)) {
					System.arraycopy(defaultList, i + 1, defaultList, i, size - i - 1);
					size--;
					return true;
				}
		}
		return false;
	}

	@Override
	public boolean set(int index, T element) {
		if (index < 0 || index >= size)
			return false;
		defaultList[index] = element;
		return true;
	}

	@Override
	public int size() {
		return size;
	}

	// 迭代器
	private class Iterator implements MyIterator<T> {
		private int next;
		@Override
		public boolean hasNext() {
			return next < size;
		}

		@SuppressWarnings("unchecked")
		@Override
		public T next() {
			return (T) defaultList[next++];
		}

		@Override
		public T remove() {
			// TODO Auto-generated method stub
			return null;
		}
	}
}

class MyLinkedList<T> implements MyList<T> {
	private int size; // 存放的元素个数,会默认初始化为0
	private Node<T> first; // 首节点，默认初始化为null

	@Override
	public MyIterator<T> iterator() {
		return new Iterator();
	}

	@Override
	public boolean add(T t) {
		if (size == 0) {
			first = new Node<T>(t, null);
			size++;
			return true;
		}
		Node<T> node = first;
		while (node.next != null)
			node = node.next;
		node.next = new Node<T>(t, null);
		size++;
		return true;
	}

	@Override
	public T get(int index) {
		Node<T> node = first;
		while (--index >= 0)
			node = node.next;
		return node.data;
	}

	@Override
	public T remove() {
		return remove(size - 1);
	}

	@Override
	public T remove(int index) {
		if (index < 0 || index >= size)
			return null;
		Node<T> node = first;
		while (--index > 0)
			node = node.next;
		T element = node.next.data;
		node.next = node.next.next;
		size--;
		return element;
	}

	@Override
	public boolean remove(T element) {
		if (element == null) {
			if (first.data == null) {
				first = first.next;
				size--;
				return true;
			}
			Node<T> node = first;
			do {
				if (node.next.data == null) {
					node.next = node.next.next;
					size--;
					return true;
				}
				node = node.next;
			} while (node.next != null);
		} else {
			if (first.data.equals(element)) {
				first = first.next;
				size--;
				return true;
			}
			Node<T> node = first;
			do {
				if (node.next.data.equals(element)) {
					node.next = node.next.next;
					size--;
					return true;
				}
				node = node.next;
			} while (node.next != null);
		}
		return false;
	}

	@Override
	public boolean set(int index, T element) {
		if (index < 0 || index >= size)
			return false;
		Node<T> node = first;
		while (--index > 0)
			node = node.next;
		node.data = element;
		return true;
	}

	@Override
	public int size() {
		return size;
	}

	// 链表节点
	private static class Node<T> {
		T data;
		Node<T> next;

		Node(T data, Node<T> next) {
			this.data = data;
			this.next = next;
		}
	}

	// 遍历器
	private class Iterator implements MyIterator<T> {
		private Node<T> next; // 下一个节点

		Iterator() {
			next = first;
		}

		@Override
		public boolean hasNext() {
			return next != null;
		}

		@Override
		public T next() {
			T data = next.data;
			next = next.next;
			return data;
		}

		@Override
		public T remove() {
			// TODO Auto-generated method stub
			return null;
		}
	}
}

interface MyIterator<T> {
	boolean hasNext(); // 是否还有下一个元素
	T next(); // 得到下一个元素
	T remove();
}

class IteratorTestUse {

	public static void main(String args[]) {
		// 分别定义两种结构
		MyList<String> array = new MyArrayList<String>();
		MyList<String> link = new MyLinkedList<String>();
		// 添加数据

		for (int i = 1; i < 15; i++) {
			array.add(i + "");
			link.add(i + "");
		}

		// 数组操作
		System.out.println(array.remove());
		System.out.println(array.get(5));
		System.out.println(array.remove(5));
		System.out.println(array.get(5));
		System.out.println(array.remove("7"));
		System.out.println(array.set(0, "00"));
		// 使用迭代器
		MyIterator<String> ai = array.iterator();
		while (ai.hasNext()){
			System.out.print(ai.next() + " ");
		}
		
		System.out.println();
		System.out.println(link.remove());
		System.out.println(link.get(5));
		System.out.println(link.remove(5));
		System.out.println(link.get(5));
		System.out.println(link.remove("7"));
		System.out.println(link.set(0, "00"));

		// 使用迭代器

		MyIterator<String> li = link.iterator();

		while (li.hasNext()){
			System.out.print(li.next() + " ");
		}
		
		System.out.println();
		System.out.println("a size=" + array.size());
		System.out.println("l size=" + link.size());
	}
}
