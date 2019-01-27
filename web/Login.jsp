<%-- 
    Document   : Log
    Created on : 30-Jul-2018, 14:59:22
    Author     : Administrator
--%>

<%@page import="javax.persistence.criteria.Expression"%>
<%@page import="model.Korisnici"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Util.Util"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/style2.css" rel="stylesheet" />
    </head>
    <body>
        <div class="form-area1">
            <h3>Login </h3>
            <form action="Login" method="post">
                <p>Username </p>
                <input type="text" name="username" placeholder="Unesi korisnicko ime">  
                <p>Password </p>
                <input type="password" name="password"  placeholder="Unesi lozinku">  
                <input type="checkbox"title="Uloguj se kao zaposleni" class="ck" name="zaposleni" id="checkbox">
                <p></p>
                <input type="submit" value="Uloguj se" >
                <input type="submit" value="Registruj se" onclick="javascript: form.action = 'Registracija.jsp';">        
                <a href="index.jsp" >Nazad </a>

            </form>



        </div>
    </body>
</html>
