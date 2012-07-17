<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
    <title><s:text name="modcheck.name"/></title>
    <s:head />
	<link type="text/css" href="pals.css" rel="stylesheet" />
	</head>

	<body>
	<s:include value="User/Top.jsp"></s:include>

	<div class="mainWelcome">
   	    
	<s:if test="!loggedIn">
   	
   		<s:actionerror/>
   		<div>
   		<div id="login-form">
	   		<s:form action="Login">
	   			<s:textfield name="username" label="UserName"/>
	    		<s:password  name="password" label="Password"/>
	    		<br>
	    		<s:submit cssClass="pbut" value="Log in" />
	   		</s:form>
   		</div>
   		<div id="need-an-account">
   		    <a href="/pals/Account/RegisterForm.action">Need an account?</a>
   		</div>
   		</div>
   		<div class="float-clear"></div>
	    <hr size=1 />
   	</s:if>
   	
<h3>
Welcome to PALS
</h3>
<p>
PALS is a web application for evaluating land surface models and the data sets used to test them. It provides driving and evaluation data for particular modelling experiments as well as a wide range of diagnostic performance measures once model output created using these data is uploaded. 
</p>
<p>
PALS is currently under development, but it is fully operational and we encourage you to use it now. PALS is free, you simply need to follow the 'register' link at the top of this page to create an account.
</p>
<p>
<strong>Data and scale of experiments:</strong> At this stage, PALS analysis is restricted to flux tower data, although we're in the process of adding global-scale radiation and runoff experiments. PALS developers will endeavour to work with International Land Atmosphere Model Benchmarking (ILAMB) activity developers to port new ILAMB benchmarks as they are formalised.
</p>
<p>
<strong>The nature of the automated analyses:</strong> Once you've uploaded your model output, PALS automatically runs a collection of analysis scripts comparing it to observed data as well as benchmark model time series, and produces a range of graphs across several model output variables. The analysis types for flux tower data include: average diurnal and seasonal cycles, smoothed time series, scatter plots, frequency domain measures, taylor diagrams, probability density functions and model energy and mass conservation information. These are applied to latent, sensible and ground heat fluxes, as well at net ecosystem exchange of CO2 and net radiation where data permits. Where appropriate, graphs will display which part of the time series are gap-filled data and which are observed. Most analysis types also have an associated scalar skill-score (e.g. normalised mean error for time series).
</p>
<p>
<strong>Private workspaces:</strong> PALS can be used in either a public or private mode by utilising the workspace feature. Once you've created a workspace, all the content you create within it can only be seen by those PALS users you invite to join the workspace.
</p>
<p>
<strong>Features in development:</strong>
<ul>
<li>A report generation facility that summarises a model's performance in a collection of nominated experiments against specified model benchmarks.</li>
<li>A website 'front-end' (this page) that shows the performance of all submitted model output for any dataset or experiment probabilistically. This feature is intended to be something akin to an ongoing, automated PILPS experiment.</li>
</ul>
</p>
<p>
For more information contact <a href="mailto:palshelp@gmail.com">palshelp@gmail.com</a>. We'd particularly like to hear from any developers keen to contribute or groups interested in expanding the scope of PALS. PALS is currently hosted by the Climate Change Research Centre at the University of New South Wales, but will move to the (Australian) National Computational Infrastructure (NCI) in the near future with the help of the Terrestrial Ecosystem Research Network (TERN). While we endeavour to maintain PALS at the highest standards, the authors and contributors take no responsibility whatsoever for damages of any kind resulting from the use of the PALS site.
</p>

	<br />
	
	<div class="small">
	Last updated 4 July 2012.
	</div>
	
	<p>&nbsp;</p>
   
   </div>
   </body>
	
</html>
