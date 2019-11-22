<%@ page language="java"  pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  function start(){
  var now=new Date();
  var hr=now.getHours();
  var min=now.getMinutes();
  var sec=now.getSeconds();
  var clocktext="现在时间:"+hr+":"+min+":"+sec;
  var timeTD=document.getElementById("timeArea");
  timeTD.innerText=clocktext;
  }
  window.setInterval("start()",1000);
  </script>
  </head>
  <body>
  <table width="100%" height="100%">
  <tr width="100%" height="100%">
  <td></td>
  <td id="timeArea" align="right" valign="bottom"></td>
  </tr>
  </table>
 </body>
    </html>
   