<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ page import="java.io.*"%>
<jsp:useBean id="conn" class="yang.conn.conn" scope="page"/>
<%!  //先声明
char[] c={' '};
String szSpace=new String(c);
StringBuffer myTranslate(StringBuffer sour){
   for(int i=0;i<sour.length();i++){
      if(sour.substring(i,i+1).equals(szSpace)){ //替换空格
        sour.delete(i,i+1);
     sour.insert(i,"&nbsp;");
  }
   if(sour.substring(i,i+1).equals("\n")){  //替换换行
        sour.delete(i,i+1);
     sour.insert(i,"\n");
  }                
 }
 return sour;
}%>
<%

Connection con=conn.getConn();
Statement stmt=con.createStatement();
ResultSet rs;



 String xuehao=request.getParameter("xuehao");
 
  // name1=new String(name1.getBytes("ISO-8859-1"),"GBK");
 
   String name=request.getParameter("name");
  name=new String(name.getBytes("ISO-8859-1"),"gb2312");
   String sex=request.getParameter("sex");
   sex=new String(sex.getBytes("ISO-8859-1"),"gb2312");
   
  String chushen=request.getParameter("chusheng");
   // sheng1=new String(sheng1.getBytes("ISO-8859-1"),"GBK");
    
  String email=request.getParameter("email");
  
       String tel=request.getParameter("tel");
 //  teshu=new String(teshu.getBytes("ISO-8859-1"),"gb2312");
        
            // shouji=new String(shouji.getBytes("ISO-8859-1"),"gb2312");
		    String jianli=request.getParameter("jianli");
   jianli=new String(jianli.getBytes("ISO-8859-1"),"gb2312");
   
   jianli=jianli.replaceAll("'","\"");


 // 输出
//StringBuffer Memo = new StringBuffer(jianli);
//Memo = myTranslate(Memo);
   

String strSQL="update  class set  name='"+name+"', sex='"+sex+"',birthday='"+chushen+"',email='"+email+"',tel='"+tel+"',jianli='"+jianli+"' where xuehao='"+xuehao+"'";

rs=stmt.executeQuery("select * from class where xuehao='"+xuehao+"'");

if(rs.next())
{
stmt.executeUpdate(strSQL);
//session.setAttribute("user",name1);
%>
<span class="STYLE49 STYLE85">
<div align="center">
<table width="422">
    <tr><td width="473" height="119">
      <p>

      
      <p>修改成功！
        
        <%
}
else
{
out.println("更新失败!");
}%>
      </p></td></tr>
</table>
 

<a href="javascript:history.back()">返回</a>