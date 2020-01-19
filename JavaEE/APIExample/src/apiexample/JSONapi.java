package apiexample;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.json.JSONException;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JSONapi
 */
public class JSONapi extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
     
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String page = req.getParameter("page");
       // 将数据添加到数组
       List<String> newslist = new ArrayList<String>();
       if (page == null || page.equals("0")) {
          newslist.add("1");
          newslist.add("2");
          newslist.add("3");
          newslist.add("4");
          newslist.add("5");
          newslist.add("6");
       }
       else {
          newslist.add("01");
          newslist.add("02");
          newslist.add("03");
          newslist.add("04");
          newslist.add("05");
          newslist.add("06");
       }
       // 调用json.jar工具封装json
       JSONObject object = new JSONObject();
       for(String str : newslist){
          try {
             object.put(str, str+":"+page);
          } catch (JSONException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
       }
       String json = object.toString();
 
       // 输出到界面
       System.out.println(json);
       resp.setContentType("text/plain");
       resp.setCharacterEncoding("gb2312");
       PrintWriter out = new PrintWriter(resp.getOutputStream());
       out.print(json);
       out.flush();
       // 更多Json转换使用请看JsonTest类
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       this.doGet(req, resp);
    }

}
