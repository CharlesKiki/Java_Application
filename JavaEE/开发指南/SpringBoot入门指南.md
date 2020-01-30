#### 这是什么

------

这是一个单独的VScode项目，需要Java和Spring框架插件的支持。这可能也需要Maven的支持。

SpringBoot内置了Tomcat，所以它的诸多配置简化了许多 这种设计是为了微服务的
这意味着只需要一个简单的
Application.Run()就可以完成一个服务开始，详细参考SpringBoot怎么快速的制作一个HelloWorld

实际上，Controller这些概念并不是一定要体现在HelloWorld这个例子中的

运行的方法：
打开项目之后，如果正常安装了插件在文件编辑器的下方中有SpringBootDashBoard区域
从中启动SpringBoot项目

SpringBoot和整个的Spring一样，都可以进行AOP编程。



#### 如何使用Idea来学习Spring

------

1.配置Idea
    1.然而IntelliJ IDEA免费版并不支持Tomcat和JSP
2.项目配
在使用Maven原型创建项目的时候务必注意应该采用apache包名的原型
这份原型项目会自动的生成SpringWeb需要的目录结构和基本配置
Maven项目下的Pom文件具有添加项目依赖的作用，可以方便的引入需要的Java依赖
    1.spring配置



#### 使用Spring来制作最简单的前后端分离项目

#### Building a RESTful Web Service

build a service that will accept HTTP GET requests at

`http://localhost:8080/greeting`.

创建一个API需要：

#### Create a Resource Representation Class

The service will handle `GET` requests for `/greeting`, optionally with a `name` parameter in the query string. The `GET` request should return a `200 OK` response with JSON in the body that represents a greeting. It should resemble the following output:

```json
{
    "id": 1,
    "content": "Hello, World!"
}
```

Spring框架将会负责对指定URL的请求的解析，请求中可能存在可选的参数。

在正常的情况下，Get请求应该返回一个200 OK返回值，并且含有一个JSON格式信息。

The `id` field is a unique identifier for the greeting, and `content` is the textual representation of the greeting.

JSON文件的返回值可能是具有特殊含义的，其中，ID可能是具有特殊唯一性的值。这可以视为一个业务的可选用字段。

To model the greeting representation, create a resource representation class. To do so, provide a plain old Java object with fields, constructors, and accessors for the `id` and `content` data, as the following listing (from `src/main/java/com/example/restservice/Greeting.java`) 

在Spring来看，一个JSON数据实际上是通过JavaClass经过JSON序列化之后得到的。当然，这也可以用手写的方式返回一个JSON格式数据。

从这一点来看，传统的Java项目自从进行Web设计之后的MVC模式之后，出现了Model层次，而API实际上就是将Model层次进行了序列化。这个请求同样是针对MVC中的Controller而言的。

#### Create a Resource Controller

In Spring’s approach to building RESTful web services, HTTP requests are handled by a controller. 在Spring框架中，处理HTTP请求的是Controller。

These components are identified by the [`@RestController`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html) annotation。这一类的设计往往由Spring中的标签完成，这不同于Servlet所用的继承后处理HTTP请求的形式。

This controller is concise and simple, but there is plenty going on under the hood. We break it down step by step.形式上它是简单的，但是背后却有很多操作。

The `@GetMapping` annotation ensures that HTTP GET requests to `/greeting` are mapped to the `greeting()` method.

Spring特有的注解将会让路由指向Controller方法，这类似Servlet的简单API方法。

> There are companion annotations for other HTTP verbs (e.g. `@PostMapping` for POST). There is also a `@RequestMapping` annotation that they all derive from, and can serve as a synonym (e.g. `@RequestMapping(method=GET)`).
>
> 处理HTTP请求的注解有非常多中

`@RequestParam` binds the value of the query string parameter `name` into the `name` parameter of the `greeting()` method. If the `name` parameter is absent in the request, the `defaultValue` of `World` is used.

请求参数注解将从请求中的字段作为参数传入。

The implementation of the method body creates and returns a new `Greeting` object with `id` and `content` attributes based on the next value from the `counter` and formats the given `name` by using the greeting `template`.

A key difference between a traditional MVC controller and the RESTful web service controller shown earlier is the way that the HTTP response body is created. 

MVC controller和RESTful web service controller实际上是有区别的。

Rather than relying on a view technology to perform server-side rendering of the greeting data to HTML, this RESTful web service controller populates and returns a `Greeting` object. 

传统的控制器在服务器端返回渲染过的HTML模板，然而RESTful web service controller返回一个对象。

The object data will be written directly to the HTTP response as JSON.

这个对象将会被以JSON的形式直接被HTTP传输。

This code uses Spring [`@RestController`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html) annotation, which marks the class as a controller where every method returns a domain object instead of a view. It is shorthand for including both `@Controller` and `@ResponseBody`.

The `Greeting` object must be converted to JSON. Thanks to Spring’s HTTP message converter support, you need not do this conversion manually. Because [Jackson 2](https://wiki.fasterxml.com/JacksonHome) is on the classpath, Spring’s [`MappingJackson2HttpMessageConverter`](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/json/MappingJackson2HttpMessageConverter.html) is automatically chosen to convert the `Greeting` instance to JSON.

`@SpringBootApplication` is a convenience annotation that adds all of the following:

- `@Configuration`: Tags the class as a source of bean definitions for the application context.
- `@EnableAutoConfiguration`: Tells Spring Boot to start adding beans based on classpath settings, other beans, and various property settings. For example, if `spring-webmvc` is on the classpath, this annotation flags the application as a web application and activates key behaviors, such as setting up a `DispatcherServlet`.
- `@ComponentScan`: Tells Spring to look for other components, configurations, and services in the `com/example` package, letting it find the controllers.

The `main()` method uses Spring Boot’s `SpringApplication.run()` method to launch an application.

main方法使用框架特有的方法作为启动。

 Did you notice that there was not a single line of XML? There is no `web.xml` file, either. 

虽然Spring项目本质上也是一个Web项目，但是它并没有配置Web.xml配置文件。

This web application is 100% pure Java and you did not have to deal with configuring any plumbing or infrastructure.

利用Spring开发的项目可以纯粹的使用Java来编写，而不必显式的配置网站服务。

## Test the Service

Now that the service is up, visit `http://localhost:8080/greeting`, where you should see:

```json
{"id":1,"content":"Hello, World!"}
```

Provide a `name` query string parameter by visiting `http://localhost:8080/greeting?name=User`. Notice how the value of the `content` attribute changes from `Hello, World!` to `Hello, User!`, as the following listing shows:

```json
{"id":2,"content":"Hello, User!"}
```

This change demonstrates that the `@RequestParam` arrangement in `GreetingController` is working as expected. The `name` parameter has been given a default value of `World` but can be explicitly overridden through the query string.

Notice also how the `id` attribute has changed from `1` to `2`. This proves that you are working against the same `GreetingController` instance across multiple requests and that its `counter` field is being incremented on each call as expected.

## See Also

The following guides may also be helpful:

- [Accessing GemFire Data with REST](https://spring.io/guides/gs/accessing-gemfire-data-rest/)
- [Accessing MongoDB Data with REST](https://spring.io/guides/gs/accessing-mongodb-data-rest/)
- [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
- [Accessing JPA Data with REST](https://spring.io/guides/gs/accessing-data-rest/)
- [Accessing Neo4j Data with REST](https://spring.io/guides/gs/accessing-neo4j-data-rest/)
- [Consuming a RESTful Web Service](https://spring.io/guides/gs/consuming-rest/)
- [Consuming a RESTful Web Service with AngularJS](https://spring.io/guides/gs/consuming-rest-angularjs/)
- [Consuming a RESTful Web Service with jQuery](https://spring.io/guides/gs/consuming-rest-jquery/)
- [Consuming a RESTful Web Service with rest.js](https://spring.io/guides/gs/consuming-rest-restjs/)
- [Securing a Web Application](https://spring.io/guides/gs/securing-web/)
- [Building REST services with Spring](https://spring.io/guides/tutorials/bookmarks/)
- [React.js and Spring Data REST](https://spring.io/guides/tutorials/react-and-spring-data-rest/)
- [Building an Application with Spring Boot](https://spring.io/guides/gs/spring-boot/)
- [Creating API Documentation with Restdocs](https://spring.io/guides/gs/testing-restdocs/)
- [Enabling Cross Origin Requests for a RESTful Web Service](https://spring.io/guides/gs/rest-service-cors/)
- [Building a Hypermedia-Driven RESTful Web Service](https://spring.io/guides/gs/rest-hateoas/)
- [Circuit Breaker](https://spring.io/guides/gs/circuit-breaker/)





#### 关于配置

SpringBoot如何配置依赖？

Marven在这里怎么使用？



常见错误：默认从springboot弄回来的东西是不含有springframework其他的包的 这意味着需要在Maven配置文件中添加依赖。



如何创建spring项目

eclipse下创建maven spring MVC 项目

首先这是一个Maven项目，其次这个项目在Eclipse中打开，所i总的项目由Maven管理，但是具体的编辑和其他工作由Eclispe完成



实际上，虽然这是Spring的启动代码，但是当你需要创建一个API接口时，实际上并不需要在main方法中编写任何代码。该方法的唯一用途仅仅是启动Spring框架应用，而API则是应用中的一个体现。

```java
@SpringBootApplication
public class ResTfulWebServiceApplication {

   public static void main(String[] args) {
      SpringApplication.run(ResTfulWebServiceApplication.class, args);
   }

}
```

