<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
   <title><s:text name="modcheck.name"/></title>
   <s:head />
   <link type="text/css" href="../pals.css" rel="stylesheet" />
</head>
<body>

<s:include value="/User/Top.jsp"></s:include>

<div class="main-width">
<div class="forgot-password-width">
<h3>Forgot Your Password?</h3>
<p><s:property value="message" /></p>
</div>
</div>
</body>
</html>