 <%@page contentType="text/html;charset=utf-8"%>
 <%@page contentType="text/html;charset=utf-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>帮助文档</title>
	</head>
	<body>
	<div>
                         JDBC 资料
                                 
一）JDBC原理概述

1，JDBC是一套协议，是JAVA开发人员和数据库厂商达成的协议，也就是由Sun定义一组接口，由数据库厂商来实现，
   并规定了JAVA开发人员访问数据库所使用的方法的掉用规范。

2，JDBC的实现是由数据库厂商提供，以驱动程序形式提供。

3，JDBC在使用前要先加载驱动。
  JDBC对于使用者要有一致性，对不同的数据库其使用方法都是相同的。

	jdbc功能：连接db(网络服务器)
          	  驱动db
	  	  使用事务
	  	  处理结果集

4、driver开发必须要实现Driver接口。
     JDBC驱动程序的类型

　　目前比较常见的JDBC驱动程序可分为以下四个种类：

　　（1）JDBC-ODBC-Bridge加ODBC驱动程序

　　JavaSoft桥产品利用ODBC驱动程序提供JDBC访问。
    注意，必须将ODBC二进制代码（许多情况下还包括数据库客户机代码）加载到使用该驱动程序的每个客户机上。
    因此，这种类型的驱动程序最适合于企业网（这种网络上客户机的安装不是主要问题），或者是用Java编写的三层结构的应用程序服务器代码。

　　（2）本地API

　　这种类型的驱动程序把客户机API上的JDBC调用转换为Oracle、Sybase、Informix、DB2或其它DBMS的调用。
    注意，象桥驱动程序一样，这种类型的驱动程序要求将某些二进制代码加载到每台客户机上。

　　（3）JDBC网络纯Java驱动程序

　　这种驱动程序将JDBC转换为与DBMS无关的网络协议，之后这种协议又被某个服务器转换为一种DBMS协议。
    这种网络服务器中间件能够将它的纯Java客户机连接到多种不同的数据库上。所用的具体协议取决于提供者。
    通常，这是最为灵活的JDBC驱动程序。有可能所有这种解决方案的提供者都提供适合于Intranet用的产品。
    为了使这些产品也支持Internet访问，它们必须处理Web所提出的安全性、通过防火墙的访问等方面的额外要求。
    几家提供者正将JDBC驱动程序加到他们现有的数据库中间件产品中。

　　（4）本地协议纯Java驱动程序

　　这种类型的驱动程序将JDBC调用直接转换为DBMS所使用的网络协议。
    这将允许从客户机机器上直接调用DBMS服务器，是Intranet访问的一个很实用的解决方法。
    由于许多这样的协议都是专用的，因此数据库提供者自己将是主要来源，有几家提供者已在着手做这件事了。

　　据专家预计第（3）、（4）类驱动程序将成为从JDBC访问数据库的首方法。
    第（1）、（2）类驱动程序在直接的纯Java驱动程序还没有上市前会作为过渡方案来使用。
    对第（1）、（2）类驱动程序可能会有一些变种，这些变种要求有连接器，但通常这些是更加不可取的解决方案。
    第（3）、（4）类驱动程序提供了Java的所有优点，包括自动安装（例如，通过使用JDBC驱动程序的appletapplet来下载该驱动程序）。
  
5、JDBC的API

java.sql包和javax.sql包

	Driver接口         代表驱动程序，代表所有的驱动程序，所有的驱动必须首先实现这个接口
	DriverManager类    辅助管理驱动类，它可以创建连接，它本身就是一个创建Connection的工厂(Factory)。
	Connection接口       由驱动接口产生的对象，代表数据库连接，会根据不同的驱动产生不同的连接

	Statement接口              这三个接口统一叫Statement,代表数据库操作对象，发送sql语句
	PreparedStatement接口       主要用的是这个
	CallableStatement接口

	ResultSet接口           结果集，结构是二维表。是用来接收select语句返回的查寻结果的。其实质类似于集合。  

	DatabaseMetadata接口     数据库元数据
	ResultSetMetadata接口    结果集元数据

	Types类     定义了一些JDBC类型的常量,JDBCo类型是sql类型的子集


	以上的资源都需要释放，释放的是数据库的资源
二）JDBC的开发步骤
	JDBC应用步骤
		1，注册加载一个driver驱动
		2，创建数据库连接（Connection）
		3，创建一个Statement（发送sql）
		4，执行sql语句
		5，处理sql结果（select语句）
		6，关闭Statement
		7，关闭连接Connection。

	注意：6，7两个步骤势必须要做的，因为这些资源是不会自动释放的，必须要自己关闭


6、jdbc的开发环境和步骤：
		环境配置：
			(1) 命令行

				例如: 把连接oracle的驱动程序ojdbc14.jar配置到环境变量的CLASSPATH中
			
				例：export CLASSPATH=.:/home/soft01/ojdbc14.jar

			(2)IDE工具

		开发步骤：
			(1)加载驱动
			(2)获取连接
			(3)操作DB
			(4)释放连接
	

一，注册加载驱动driver，也就是强制类加载
    1、第一种方法
       driver = "oracle.jdbc.driver.OracleDriver";
       Class.forName(driver);
      

    2、第二种方法
	Driver d=new Driver类();
      例： Driver d = new oracle.jdbc.driver.OracleDriver();
          DriverManager.registerDriver(d);
       
    3、第三种：编译时利用虚拟机的系统属性
       java -Djdbc.drivers=oracle.jdbc.driver.OracleDriver 类名（文件）       

    	Oracle的Driver的全名oracle.jdbc.driver.OracleDriver
    	mysql的Driver的全名com.mysql.jdbc.Driver
    	SQLServer的Driver的全名com.microsoft.jdbc.sqlserver.SQLServerDriver

二，创建连接

    DriverManager.getConnection(String url,String username,String password);
    Connection连接是通过DriverManager的静态方法getConnection(.....)来得到的，这个方法的实质是把参数传到实际的Driver中的connect()方法中来获得数据库连接的。
    Oracle的URL值是由连接数据库的协议和数据库的IP地址及端口号还有要连接的库名（DatebaseName）
    Oracle URL的格式
    jdbc:oracle:thin:（协议）@XXX.XXX.X.XXX:XXXX（IP地址及端口号）:XXXXXXX（所使用的库名）
    例：jdbc:oracle:thin:@192.168.0.39:1521:TARENADB
    MySql URL的写法
    例： jdbc:mysql://192.168.8.21:3306/test
    SQLServer URL的写法
    例：jdbc:microsoft:sqlserver://192.168.8.21:1433

    java -Djdbc.drivers=驱动全名 类名

    使用系统属性名，加载驱动 -D表示为系统属性赋值
    
    使用Connection对象获得一个Statement，Statement中的executeQuery(String sql) 方法可以使用select语句查询，并且返回一个结果集 ResultSet通过遍历这个结果集，
    可以获得select语句的查寻结果，ResultSet的next()方法会操作一个游标从第一条记录的前边开始读取，直到最后一条记录。
    executeUpdate(String sql) 方法用于执行DDL和DML语句，可以update，delete操作。

注意：要按先ResultSet结果集，后Statement，最后Connection的顺序关闭资源，因为Statement和ResultSet是需要连接是才可以使用的，
      所以在使用结束之后有可能起他的Statement还需要连接，所以不能现关闭Connection。  
                       
	
    查询时获得结果用rs.ne二、Statement 
	execute(sql); 当不知道执行的SQL语句是什么类型的时候执行 ，返回值是boolean
	executeQuery(sql); 执行查询语句(select)
	返回值是 ResultSet
	executeUpdate(sql); 执行更新语句(insert,update,delete)
	返回值是 int ,执行的行计数，或是0表示不返回任何数据的SQL语句。

    Statement与PreparedStatement的区别:
     	某些情况下PreparedStatement比Statement效率高
     	Statement类型安全方法比较弱
     	PreparedStatement比Statement代码结构清晰

三、PreparedStatement
	可以使用参数替代sql语句中的某些参数使用 "?"代替，他先将带参数的sql语句发送到数据库，进行编译，然后PreparedStatement会将参数发送给数据库。
	在使用PreparedStatement时，在设置相应参数时，要指明参数的位置和类型，以及给出参数值
	根据不同的参数类型使用不同的setXXX(参数的位置，参数值)来设置参数

	例：update xxx set i=10.5 where no='123';    //只有xxx参数不同的SQL语句叫同构SQL 

	   昨天写的SQL语句就叫异构SQL,PreparedStatement要采用同构的SQL

	用Statement时：update t_xxx set i=10.5 where no='123';
	用PreparedStatement时：update t_xxx set i=? where no=?;
			ps.setDouble(1,10.5);
			ps.setString(2,"123");
		       或ps.setDate(3,new Date());
	

CallableStatement是可以用非sql语句来访问数据库，他是通过调用存储过程（PL/SQL）来访问数据库的。可以直接使用连接来调用 prepareCall(...)方法，来执行这个存储过程，"..."是存储过程的名字。

对于系统时间要去数据库时间
TimeStamp 和 Date都可以保存时间
TimeStamp可以保存时、分、秒的数据，Date只保存日期年月的信息。

SQLException是检查异常必须处理要么throws ，要么try{}catch(){}
getErrorCode()可以获得错误码，可以对错误进行查询。

三）相关知识。

一、元数据

	元数据就是数据本身结构方面的信息。

JDBC中有两种元数据,一种是数据库元数据,另一种是ResultSet元数据。

元数据就是描述存储用户数据的容器的数据结构。

ResultSet rs=ps.executeQuery(sql);
ResultSetMetaData m=rs.getMetaData();

getColumnCount(),获得实际列数
getColumnName(int colnum)，获得指定列的列名
getColumnType(int colnum)，获得指定列的数据类型
getColumnTypeName(int colnum)，获得指定列的数据类型名

//打印结果集
public static void printRS(ResultSet rs)throws SQLException{
    ResultSetMetaData rsmd = rs.getMetaData();
    while(rs.next()){
       for(int i = 1 ; i < = rsmd.getColumnCount() ; i++){
          String colName = rsmd.getColumnName(i);
          String colValue = rs.getString(i);
          if(i>1){
             System.out.print(",");
          }
          System.out.print(name+"="+value);
       }
       System.out.println();
    }
}


二、数据库元数据

DatabaseMetaData
getURL(),获得连接数据库的URL
getDatabaseProductName() 获得数据库产品的名称
getDriverVersion() 获得JDBC驱动程序的String形式的版本号
getTables()获得数据库中该用户的所有表
getUserName() 获得数据库用户名。

三、事务（Transaction）

事务是针对原子操作的，要求原子操作不可再分，要求原子操作必须同时成功同时失败。
事务是捆绑的原子操作的边界。
JDBC中使用事务，先要使用连接调用setAutoCommite(false)方法，把自动提交（commit）置为false。打开事务就要关闭自动提交。不用事务是要把setAutoCommite(true)

在处理事务时，在发送sql语句后执行成功并确认时，就在try块中使用连接调用commit()方法来发送提交信息，
在发送sql语句后执行失败时，会在catch语句块中使用连接调用rollback()方法来发送回滚信息，也可以在需要时做回滚操作（主观原因）。

四、JDBC事务并发产生的问题和事务隔离级别

1，脏读（dirty read），读取到了没有提交的数据。
2，不可重复读（UnPrpeatable Read），两次读取到了不同的数据，就是要保持在同一时间点上两次读取到的数据相同，
   不能够使查询数据时进行改变。
3，幻读（phantom），在两次查询同一时间点数据时，数据数量发生改变，要保持在同一时间点上两次读取到的数据相同。

事务隔离级别

TRANSACTION_NONE不使用事务。
TRANSACTION_READ_UNCOMMITTED 可以读取为提交数据。
TRANSACTION_READ_COMMITTED可以避免脏读，不能够读取没提交的数据，最常用的隔离级别  大部分数据库的默认隔离级别
TRANSACTION_REPEATABLE_READ可以避免脏读，重复读取，
TRANSACTION_SERIALIZABLE可以避免脏读，重复读取和幻读，（事务串行化）会降低数据库效率

以上的五个事务隔离级别都是在Connection类中定义的静态常量，使用setTransactionIsolation(int level) 方法可以设置事务隔离级别。

xt() ----移动游标指向下一个位置      
</div>
</body>
</html>
	
        
