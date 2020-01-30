还可以ctrl+shift+t 然后输入你要找的java类。


Eclipse 快捷键不少，但有几个比较常用并且有用的，记住并且善用还是很好的，每天一小记。
 
Ctrl + Shift + T ， 这里面的T ，是 Type，该快捷键可以搜索任何处在当前classpath下面的类。
 
Ctrl + Shift + R ， 这里面的R ，是Resource，该快捷键可以搜索任何文件类型的资源。

Ctrl + Shift + G    这里你可以看到哪些地方调用它

Ctrl + H  这里是搜索快捷键
 
Alt  + Shift + R  ,  R -> rename , 重名变量，或者方法，在当前文件中所有类似的引用均会被修改，但注意可能会修改掉 引用的类名。
 
Ctrl + shift + O ,  自动引用包。



（1）Ctrl+M －－切换窗口的大小
（2）Ctrl+Q －－跳到最后一次的编辑处
（3）F2        －－当鼠标放在一个标记处出现Tooltip时候按F2则把鼠标移开时Tooltip还会显示即Show Tooltip Description。
          F3        －－跳到声明或定义的地方。
          F5       －－单步调试进入函数内部。
          F6       －－单步调试不进入函数内部，如果装了金山词霸2006则要把“取词开关”的快捷键改成其他的。
          F7       －－由函数内部返回到调用处。
          F8       －－一直执行到下一个断点。
（4）Ctrl+Pg~ －－对于XML文件是切换代码和图示窗口
（5）Ctrl+Alt+I －－看Java文件中变量的相关信息
（6）Ctrl+PgUp －－对于代码窗口是打开“Show List”下拉框，在此下拉框里显示有最近曾打开的文件
（7）Ctrl+/   －－在代码窗口中是这种//~注释。
          Ctrl+Shift+/  －－在代码窗口中是这种/*~*/注释，在JSP文件窗口中是〈!--~--〉。
（8）Alt+Shift+O(或点击工具栏中的Toggle Mark Occurrences按钮) 当点击某个标记时可使本页面中其他地方的此标记黄色凸显，并且窗口的右边框会出现白色的方块，点击此方块会跳到此标记处。
（9）右击窗口的左边框即加断点的地方选Show Line Numbers可以加行号。
（10）Ctrl+I格式化激活的元素Format Active Elements。
            Ctrl+Shift+F格式化文件Format Document。
（11）Ctrl+S保存当前文件。
            Ctrl+Shift+S保存所有未保存的文件。
（12）Ctrl+Shift+M(先把光标放在需导入包的类名上) 作用是加Import语句。
            Ctrl+Shift+O作用是缺少的Import语句被加入，多余的Import语句被删除。
（13）Ctrl+Space提示键入内容即Content Assist，此时要将输入法中Chinese(Simplified)IME-Ime/Nonlme Toggle的快捷键（用于切换英文和其他文字）改成其他的。
            Ctrl+Shift+Space提示信息即Context Information。
（14）双击窗口的左边框可以加断点。
（15）Ctrl+D删除当前行。

－－－待续

[以下为转载]
Eclipse快捷键大全
Ctrl+1 快速修复(最经典的快捷键,就不用多说了)
Ctrl+D: 删除当前行 
Ctrl+Alt+↓ 复制当前行到下一行(复制增加)
Ctrl+Alt+↑ 复制当前行到上一行(复制增加)

Alt+↓ 当前行和下面一行交互位置(特别实用,可以省去先剪切,再粘贴了)
Alt+↑ 当前行和上面一行交互位置(同上)
Alt+← 前一个编辑的页面
Alt+→ 下一个编辑的页面(当然是针对上面那条来说了)

Alt+Enter 显示当前选择资源(工程,or 文件 or文件)的属性

Shift+Enter 在当前行的下一行插入空行(这时鼠标可以在当前行的任一位置,不一定是最后)
Shift+Ctrl+Enter 在当前行插入空行(原理同上条)

Ctrl+Q 定位到最后编辑的地方
Ctrl+L 定位在某行 (对于程序超过100的人就有福音了)
Ctrl+M 最大化当前的Edit或View (再按则反之)
Ctrl+/ 注释当前行,再按则取消注释
Ctrl+O 快速显示 OutLine
Ctrl+T 快速显示当前类的继承结构
Ctrl+W 关闭当前Editer
Ctrl+K 参照选中的Word快速定位到下一个
Ctrl+E 快速显示当前Editer的下拉列表(如果当前页面没有显示的用黑体表示)

Ctrl+/(小键盘) 折叠当前类中的所有代码

Ctrl+×(小键盘) 展开当前类中的所有代码

Ctrl+Space 代码助手完成一些代码的插入(但一般和输入法有冲突,可以修改输入法的热键,也可以暂用Alt+/来代替)

Ctrl+Shift+E 显示管理当前打开的所有的View的管理器(可以选择关闭,激活等操作)

Ctrl+J 正向增量查找(按下Ctrl+J后,你所输入的每个字母编辑器都提供快速匹配定位到某个单词,如果没有,则在stutes line中显示没有找到了,查一个单词时,特别实用,这个功能Idea两年前就有了)

Ctrl+Shift+J 反向增量查找(和上条相同,只不过是从后往前查)

Ctrl+Shift+F4 关闭所有打开的Editer

Ctrl+Shift+X 把当前选中的文本全部变味小写

Ctrl+Shift+Y 把当前选中的文本全部变为小写

Ctrl+Shift+F 格式化当前代码

Ctrl+Shift+P 定位到对于的匹配符(譬如{}) (从前面定位后面时,光标要在匹配符里面,后面到前面,则反之)

下面的快捷键是重构里面常用的,本人就自己喜欢且常用的整理一下(注:一般重构的快捷键都是Alt+Shift开头的了)

Alt+Shift+R 重命名 (是我自己最爱用的一个了,尤其是变量和类的Rename,比手工方法能节省很多劳动力)

Alt+Shift+M 抽取方法 (这是重构里面最常用的方法之一了,尤其是对一大堆泥团代码有用)

Alt+Shift+C 修改函数结构(比较实用,有N个函数调用了这个方法,修改一次搞定)

Alt+Shift+L 抽取本地变量( 可以直接把一些魔法数字和字符串抽取成一个变量,尤其是多处调用的时候)

Alt+Shift+F 把Class中的local变量变为field变量 (比较实用的功能)

Alt+Shift+I 合并变量(可能这样说有点不妥Inline)
Alt+Shift+V 移动函数和变量(不怎么常用)
Alt+Shift+Z 重构的后悔药(Undo)