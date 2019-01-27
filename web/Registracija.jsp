<%-- 
    Document   : Registracija
    Created on : 14-Aug-2018, 11:05:57
    Author     : Administrator
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Util.Util"%>
<%@page import="model.Korisnici"%>
<%@page import="model.Korisnici"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registracija</title>
        <link href="css/style2.css" rel="stylesheet" />
    </head>
    <body>
        <div class="form-area">
        <h2>Registracija</h2>
        <form action="Registration" method="post">
            <p>Ime</p>
           <input type="text" name="ime" placeholder="Unesi svoje ime" required> 
            <p>Prezime </p>
           <input type="text" name="prezime" placeholder="Unesi svoje prezime" required> 
            <p>e-mail</p>
           <input id="valid"  name="eadresa" placeholder="Unesi svoju e-mail adresu"
                  type="text" pattern="[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-zA-Z0-9-]+\.com" title="example@gmail.com  required"  required>          
            <p>Broj telefona</p>
            <input id="valid" type="text" name="broj" placeholder="Unesi svoj broj telefona" pattern="06+[0-9]{1}/[0-9]{3}-[0-9]{4}" title="06x/xxx-xxxx required" 
                   required> 
           <p>Username </p>
           <input type="text" name="username" placeholder="Unesi korisnicko ime" required>  
           <p>Password </p>
           <input type="password" name="password"  placeholder="Unesi lozinku" required>  
           <p></p>
           <input type="submit" value="Potvrdi">
           <a href="index.jsp" >Nazad </a>
         
    </form>
        </div>
    </body>
</html>
