<%@page import="com.hcl.cms.SubjectCrud"%>
<%@page import="com.hcl.cms.FeedBack"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
    String fid=(String)session.getAttribute("fid");
    String instr = (String)session.getAttribute("instructor");
    String studentName=(String)session.getAttribute("studentName");
    String subject =request.getParameter("subject");
    String feed=request.getParameter("feed");		
%>
<form method="post" action="ConfirmFeedback.jsp">

FeedBack Id: <input type="text" value="<%=fid %> " name="fid" readonly="readonly"/>
Instructor : <input type="text" value=<%=instr %> " name="instructor" readonly="readonly" /><br/>
studentName : <input type="text" value=<%=studentName%> " name="studentName" readonly="readonly"/><br/>
subject: <input type="text" value=<%=subject%> " name="subject" readonly="readonly" /><br/>
feed :<input type="text" value=<%=feed%> " name="fbvalue" readonly="readonly"/><br/>

<input type="submit" value="Confirm Submit" />
</form>
<%  
      if(request.getParameter("fid") !=null &&
          request.getParameter("studentName") !=null &&
          request.getParameter("subject") !=null
        
    		  ) {
    	  FeedBack f=new FeedBack();
    	  f.setFid(request.getParameter("fid"));
    	  f.setInstructor(request.getParameter("instructor"));
    	  f.setStudentName(request.getParameter("studentName"));
    	  f.setSubject(request.getParameter("subject"));
    	  f.setFbvalue(request.getParameter("fbvalue"));
    	 SubjectCrud crud=new SubjectCrud();
    	  out.println(crud.insertFeedBack(f));
    	  
      }
     
     
     %>

</body>
</html>