<%-- 
    Document   : Hoteli
    Created on : 30-Jul-2018, 14:58:53
    Author     : Administrator
--%>
<%@page import="model.Hoteli"%>
<%@page import="java.lang.System"%>
<%@page import="Util.Util"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.*" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteli</title>
        <link href="css/style3.css" rel="stylesheet" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <div class="form-area">
            <h3>Rezervacije hotela</h3> <br>
            <form  action="hotel" method="post">
            <p>Hoteli i cena nocenja </p>
              <select name="hoteli" class="menu3">
                                <%
                                   Session s = Util.getSessionFactory().openSession();
                                    s.beginTransaction();   
                                   Criteria c = s.createCriteria(Hoteli.class); 
                                   List<Hoteli> liste = c.list(); 
                                   for (Hoteli h : liste)
                                   {
                                    out.println("<option value=" + h.getIdHoteli() + ">" + h.getNaziv() +" " + "-" + " "  + h.getCena() +
                                            " " + "€" + " " + "-"+ " " + h.getStars() + " " + "zvezdice" + " </option>");  
                                  }
                                       s.close();
                                %> 
                            
                              </select> 
    <label id="pet"  for="nocenja">Izaberite broj nocenja</label>
   <select name="num" id="nocenja">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select>                           
           <label for="in">Datum prijavljivanja u hotel</label>
                             <input id="in" name="datum" type="text" class="datepicker" required >
                             <script>
                             $(function() {
                              $( ".datepicker" ).datepicker();
                                    });
                              </script>
    
           <input type="submit" id="submit" value="Rezervisi"  >  <br> 
            <a href="index.jsp" >Nazad </a>
    </form>
          </div>
    </body>
</html>