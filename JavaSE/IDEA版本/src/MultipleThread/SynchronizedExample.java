package MultipleThread;

public class SynchronizedExample {
}

/*
 * synchronized有多种修饰的对象
 * 但是从它的使用形式上来看，它是一个关键字修饰，也可以是一个方法接受一个参数
 * */

/*
 * 修饰一个对象
 * */

/**
 * 银行账户类
 * 该类的操作都是敏感错误的，数据不应该由多线程而导致错误
 * 这个类是个维护自身数据的类型
 */
class Account {
    String name;
    float amount;

    public Account(String name, float amount) {
        this.name = name;
        this.amount = amount;
    }

    //存钱
    public void deposit(float amt) {
        amount += amt;
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    //取钱
    public void withdraw(float amt) {
        amount -= amt;
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public float getBalance() {
        return amount;
    }
}

/**
 * 账户操作类
 * 不允许直接的操作银行账户，必须通过操作类。这是命令模式
 * 这样做的好处是命令类可以是多线程的
 */
class AccountOperator implements Runnable {
    private Account account;

    public AccountOperator(Account account) {
        this.account = account;
    }

    public void run() {
        /*
        * 对当前的对象中的属性作为参数
        * 该参数将会作为锁，同时只有一个线程可以访问
        * */
        synchronized (account) {
            /*
            * 这里直接和执行体的代码耦合了，命令模式
            * 此处是同步体，内部的内码在取的锁以后才能使用
            * */
            account.deposit(500);
            account.withdraw(500);
            System.out.println(Thread.currentThread().getName() + ":" + account.getBalance());
        }
    }
}

class SynchronizedExampleTest{
    /*
    *
    * */
    public static void main(String[] args){
        //执行体初始化
        Account account = new Account("zhang san", 10000.0f);
        //命令对象初始化
        AccountOperator accountOperator = new AccountOperator(account);

        //常量，最大线程数
        final int THREAD_NUM = 5;
        //线程池，一个线程的数组
        Thread threads[] = new Thread[THREAD_NUM];
        for (int i = 0; i < THREAD_NUM; i ++) {
            /*
            * 执行线程的方式那是通过线程池的new Thread对象来实现的
            * 而不是通过AccountOperator的实例化实现的
            * */
            threads[i] = new Thread(accountOperator, "Thread" + i);
            //线程执行
            threads[i].start();
        }
    }
}
