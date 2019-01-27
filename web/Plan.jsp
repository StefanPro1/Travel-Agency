<%-- 
    Document   : Plan
    Created on : 23-Aug-2018, 11:11:13
    Author     : Administrator
--%>

<%@page import="java.util.Random"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plan leta</title>
        <link href="css/style5.css" rel="stylesheet" />
    </head>
    <body>
          <div class="form-area">
            <h3>Plan leta</h3>
            <h2>Izaberite vreme polaska</h2>
           <form action="" method="post">
          <div class="box7" >
            <div class="result">
              <c:if test="${sessionScope.logged!=null}">
          Karta do: ${sessionScope.destinacija}<br>                           
          Avio prevoznik: ${sessionScope.Akompanije}<br> 
          Broj karata: ${sessionScope.bkarata}  <br>
          Datum polaska: ${sessionScope.datum}  <br>
          Povratna karta: ${sessionScope.povratak}  <br>
              </c:if>
            
           <p>    Vas Id  : ${sessionScope.idKorisnici}  <br>  
                  Cena karte: ${sessionScope.ukupno} evra
                  Prtljag : ${sessionScope.torbe}
           </p> 
             
            </div>  
     
              <div class="time">
                  
                  <%
              Random rand = new Random();
              int  h = rand.nextInt(24) + 0;
              int m  = rand.nextInt(49) + 10;
              out.print("Let krece u "  + "     :      " + h +":"+ m);
         
                         %> <br> 
                         <br>
            <img id="img" src = "img/plane1.png" >
              </div>
   <input type="checkbox"title=" Izaberite let" class="ck" name="povratak" id="checkbox" required>
      
          </div>                   
               <div class="box8">
                     <div class="result">
              <c:if test="${sessionScope.logged!=null}">
          Karta do: ${sessionScope.destinacija}<br>                           
          Avio prevoznik: ${sessionScope.Akompanije}<br> 
          Broj karata: ${sessionScope.bkarata}  <br>
          Datum polaska: ${sessionScope.datum}  <br>
          Povratna karta: ${sessionScope.povratak}  <br>
              </c:if>
            
           <p>    Vas Id  : ${sessionScope.idKorisnici}  <br>  
                  Cena karte: ${sessionScope.ukupno} evra
                  Prtljag : ${sessionScope.torbe}
           </p> 
             
            </div>  
                 <div class="time">  
              
                     <%
              int  hh = rand.nextInt(24) + 0;
              int mm  = rand.nextInt(49) + 10;
              out.print("Let krece u"  + "    :    " +   hh +":"+ mm);
              
                         %>  <br>
                         <br>
                         <img id="img" src = "img/plane1.png" >
                   </div>
      <input type="checkbox" title=" Izaberite let" class="ck" name="povratak" id="checkbox" required>
               </div> 
           <input type="submit" value="Kupi" onclick="javascript: form.action='Placanje.jsp';">  <br>      
        <a href="index.jsp" >Nazad </a>
        <script>
         $(function(){
    var requiredCheckboxes = $(':checkbox[required]');
        requiredCheckboxes.change(function(){
        if(requiredCheckboxes.is(':checked')) {
            requiredCheckboxes.removeAttr('required');
        } else {
            requiredCheckboxes.attr('required', 'required');
        }
    });
});
</script>

<script>
   var requiredCheckboxes = $(':checkbox[required]');
   requiredCheckboxes.on('change', function() {
    requiredCheckboxes.not(this).prop('checked', false);  
}); 

    </script>
    </form>
            
            

          </div>
    </body>
</html>
