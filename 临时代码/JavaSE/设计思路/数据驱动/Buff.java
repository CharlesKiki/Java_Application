/*
    设计思路：两种属性，游戏角色属性，操作角色属性的控制属性
    Player维护一个自身状态对象，并利用状态描述属性来对
    其他Player施加影响
*/
class Player{
    //角色私有属性，buff影响自身属性
    //角色私有属性往往是生命值等，而RoleBehavior中的描述则是
    //对生命值等属性的变化描述，例如增加或减少
    private float life;
    private float attack;

    //角色技能和攻击行为描述
    //RoleBehavior是所有角色效果的集合
    //每个技能和道具的生效作用均以JSON保存
    //该对象只描述行为，但执行和分发该信息的是BuffMangager
    RoleBehavior roleBehavior;

    //维护自身状态，并影响场景中其他对象
    BuffMangager buffManager;

    //从另一个机制中获取参数
    //接受Buff参数，解析并生效
    //场景管理器维护一个发送者接收者模型
    //来自A对象的AOE效果被这种方式传递给B，并由B解析生效
    BuffReceiver buffReceiver;


    //用例：A攻击B对象
    //攻击效果和其他效果JSON --> roleBehavior --> buffManager -->施放结束
    //B的BuffReceiver --> buffManager --> 对自身生效

}

/*
BuffMangager为每个逻辑上的游戏实体管理状态，如分身则视为共享同一个BuffManager
增益类型,负面类型被描述成一段效果，它本身是对多个游戏实体属性的描述
例如生命值和攻击力可以被调整
*/
class BuffMangager{
    //buff状态描述
    string buff;

    void set(string buff){
        buff = buff;
    }

    string get(){
        return buff;
    }

    //执行buff
    /*
        buff的执行可能面向自身，也可能指向其他游戏实体
        例如AOE伤害
    */
    void Execute(){
        //对自身效果执行

        //检查当前状态
        refresh();

        //传递对其他对象效果到场景管理
        sendMessage(buff);
    }

    //解析来自场景管理器的buff效果类型
    void EffetRoute(){

    }

    //Buff作用前给场景管理器
    void sendMessage(string buff){

    }

    //每一帧都检查当前buff是否生效
    void refresh(){

    }
}


//用以表达技能等具有副作用的底层抽象
//例如，一个AOE对指定范围内有生命减少效果
//则该技能实际上是RoleBehavior的一个字段描述
//RoleBehavior同时将该描述传递给游戏机制
class RoleBehavior{
    //是否是范围效果
    bool AOE;
    //是否是瞬时效果
    bool chronic;
}

class SceneManager{
    /**
     * 注册观察者
     * @param observer 观察者
     */
     void registerObserver(Observer observer);

    /**
     * 移除观察者
     * @param observer 观察者
     */
     void removeObserver(Observer observer);

    /**
     * 在状态发生变化通知观察者
     */
    void notifyObserver(String message);
}

//场景初始化方法
main(){
    //游戏对象初始化

    //注册游戏对象
    SceneManager.registerObserver();

    //进行主循环Unity
}