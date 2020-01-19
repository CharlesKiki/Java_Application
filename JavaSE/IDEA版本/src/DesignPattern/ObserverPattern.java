package DesignPattern;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;


/*
* 比如我们有个天气服务（主题），然后有多个使用它的客户端（观察者），
* 包括android和iphone端app的服务（观察者），那么就可以使用这么模式。
* 注意这个模式的应用场景
* 一对多的关系，一对多的关系中一个变化其他几个才变化，有顺序关系
* */
public class ObserverPattern {
}



//一种结构存放天气信息 注意，省略了get、set方法
//天气的消息实体
/*
* 所谓的消息实体，也就是可能存在对象和对象之间的消息传输
* 使用传递信息的格式也是一个对象
* */
class WeatherInfo {
    private long time;
    private String weather;

    //设定属性
    public WeatherInfo(long time, String weather) {
        this.time = time;
        this.weather = weather;
    }

    //每一个类都是Object类的子类
    //这就是重写其方法，思想是从一个复杂的比较
    //变成更多小比较
    @Override
    public boolean equals(Object obj) {
        //强制类型转换
        WeatherInfo info = (WeatherInfo) obj;
        //对其属性进行检查
        return info.time == this.time && info.weather.equals(this.weather);
    }


    public String getTime() {
        return  Long.toString(time);
    }

    public String getWeather() {
        return weather;
    }
}


//主题
//定义天气服务的接口（主题），以表示它应实现哪些功能
interface IWeatherService {

    /*
    * 所谓的观察者就是所谓的订阅者，需要了解情况的一方
    * */
    void addClient(ObserverClient client); //添加观察者

    boolean deleteClient(ObserverClient client);//删除观察者

    /*
    * 思路是使用迭代器依次执行对象的获取天气对象的方法
    * 一个重要的编程思想，只要获取了对象并且可以访问，那么
    * 别人执行这个方法就会导致它的属性变化
    * 而对象也可以作为另一个对象的属性
    * 于是，OOP虽然是面向对象动态的，但是依然存在一个数据的流动顺序
    * 这就是业务上的理解和设计了
    * */
    void notifyClients(); //通知

    /*
    *
    * */
    void updateWeather(WeatherInfo info);//主题内容更新

}

//客户端的接口描述
//观察者，在这个例子中观察者也是抽象的接口
interface ObserverClient {
    //但是问题是观察者本身不应该去调用吧
    void getWeather(WeatherInfo info);
}


//具体主题
//实现具体的天气服务，这里同样用到了单例模式
enum WeatherService implements IWeatherService {

    /*
    * 一个特殊的写法，该类只会有一个实例
    * */
    instance;
    //存储天气信息
    private LinkedList<WeatherInfo> weatherInfos = new LinkedList<WeatherInfo>();
    //存储订阅对象
    private LinkedHashSet<ObserverClient> clients = new LinkedHashSet<ObserverClient>(); //存放观察者

//添加观察者

    @Override
    public void addClient(ObserverClient client) {

        clients.add(client);

    }

    //删除观察者
    @Override
    public boolean deleteClient(ObserverClient client) {

        return clients.remove(client);

    }

    //通知观察者
    @Override
    public void notifyClients() {

        Iterator<ObserverClient> iterator = clients.iterator();

        while (iterator.hasNext()) {
            //实际上Service还是和另一个类有强依赖关系
            iterator.next().getWeather(weatherInfos.peekFirst());
        }

    }


    //更新天气
    @Override
    public void updateWeather(WeatherInfo info) {

        if (weatherInfos.size() > 0)

            if (weatherInfos.peekFirst().equals(info)) return;

        weatherInfos.push(info);

        if (clients.size() == 0) return;

        notifyClients();

    }

}

//具体的客户端（观察者，此处给出两个）

class ClientAndroidServer implements ObserverClient {

    private static String name = "安卓服务";

    private WeatherInfo info;

    @Override
    public void getWeather(WeatherInfo info) {

        this.info = info;

        dealMsg();

    }

    private void dealMsg() {

        System.out.println(name + "收到最新天气：time=" + info.getTime() + "msg=" + info.getWeather() + "。马上开始推送消息...");

    }

}


class ClientIphoneServer implements ObserverClient {

    private static String name = "苹果服务";
    private WeatherInfo info;

    @Override
    public void getWeather(WeatherInfo info) {

        this.info = info;

        dealMsg();

    }

    private void dealMsg() {

        System.out.println(name + "收到最新天气：time=" + info.getTime() + "msg=" + info.getWeather() + "。马上开始推送消息...");

    }

}


class ObserverTestUse {

    public static void main(String args[]) {
        //创建主题
        /*
        * 创建服务接口
        * 该接口同样维护和订阅者的信息
        * */
        WeatherService service = WeatherService.instance;

        //添加观察者
        service.addClient(new ClientAndroidServer());
        service.addClient(new ClientIphoneServer());

        //更新主题
        /*
        * 每一次Service发生事件，应该都影响到另外两个对象
        * */
        service.updateWeather(new WeatherInfo(System.currentTimeMillis(), "多云"));
        service.updateWeather(new WeatherInfo(System.currentTimeMillis() + 1000 * 60 * 60 * 24, "多云转晴"));
        service.updateWeather(new WeatherInfo(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 2, "晴"));
    }
}








