<%@ page language="java" contentType="text/html;	charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page language="java" import="com.uniovi.sdi.*	,	java.util.List"%>
<!DOCTYPE html	PUBLIC "-//W3C//DTD	HTML	4.01	Transitional//EN"	
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>JSP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,	initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<%
String autor=(String) request.getSession().getAttribute("usuario");
String comentario= request.getParameter("comentario");
if(autor!=null){
	if(comentario!=null&&comentario!=" "){
		Comentario c= new Comentario(comentario,autor);
		ComentariosService cs= new ComentariosService();
		cs.setNuevoComentario(c);
		response.sendRedirect("comentario");
	}
}
else{
	response.sendRedirect("login.jsp");
	}

%>
	<!-- Contenido -->
	<div class="container" id="contenedor-principal">
		<h2>Añadir Comentarios</h2>
		<form class="form-horizontal"	method="post"	action="anadir-comentario.jsp">
		<div class="form-group">
				<label class="control-label	col-sm-2" for="comentario">Texto:</label>
				<div class="col-sm-10">
						<input type="text" class="form-control" name="comentario" required="true"/>
				</div>
		</div>
			<div class="form-group">								
				<div class="col-sm-offset-2	col-sm-10">
						<button type="submit" class="btn	btn-primary">Comentar</button>
				</div>
		</div>
		</form>
	</div>
</body>
</html>