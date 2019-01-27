<%-- 
    Document   : Placanje
    Created on : 20-Aug-2018, 19:03:03
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placanje</title>
        <link href="css/style4.css" rel="stylesheet" />
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
        <div class="form-area">
        <h3>Platite platnom karticom</h3>   
         <c:if test="${sessionScope.AvioKarte !=null}">
        
        <form  action="email" onsubmit="return confirm('Uspesno ste platili! Uskoro ce Vam stici e-mail sa potvrdom o uplati')">
            <p>Card Number</p> 
            <img id="png" src = "img/visa.png">
           <input type="text"  placeholder="Insert card number" pattern="4+[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}" title="4xxx-xxxx-xxxx-xxxx required" required> 
           <p>Expiry date</p>
          <select class="selected">  
                                    <option value="2">Month</option> 
                                     <option value="2">January</option>                             
	                            <option value="2">February</option>                             
	                            <option value="3">March</option>                          
	                            <option value="4">April</option>                          
	                            <option value="5">May</option>                           
	                            <option value="6">June</option>                           
	                            <option value="7">July</option>                          
	                            <option value="8">August</option>                            
	                            <option value="9">September</option>                    
	                            <option value="10">October</option>                             
	                            <option value="11">November</option>                            
	                            <option value="12">December</option>                            
	                        </select>
           
           <select class="selected"><option value="2">Year</option> 
                                    <option value="2019">2019</option>                          
	                            <option value="2020">2020</option>                           
	                            <option value="2021">2021</option>                           
	                            <option value="2022">2022</option>                          
	                            <option value="2023">2023</option>                            
	                            <option value="2024">2024</option>                    
	                            <option value="2025">2025</option>                             
	                            <option value="2026">2026</option>                            
	                            <option value="2027">2027</option>
           </select> <br>
           <p>Security Code</p>
           <input type="text"  size="15" placeholder="Insert security code" pattern="[0-9]{3}" title="code number required" required><br>
          
           <p>Ukupna cena je: ${sessionScope.ukupno} evra </p>

           <input type="submit" value="Plati"><br>
  
       
           <a href="index.jsp" >Nazad </a>
    </form>
         </c:if>
        
         <c:if test="${sessionScope.AvioKarte == null}">
          <form  action="email2" >
            <p>Card Number</p> 
            <img id="png" src = "img/visa.png">
           <input type="text"  placeholder="Insert card number" pattern="4+[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}" title="4xxx-xxxx-xxxx-xxxx required" required> 
           <p>Expiry date</p>
          <select class="selected">  
                                    <option value="2">Month</option> 
                                     <option value="2">January</option>                             
	                            <option value="2">February</option>                             
	                            <option value="3">March</option>                          
	                            <option value="4">April</option>                          
	                            <option value="5">May</option>                           
	                            <option value="6">June</option>                           
	                            <option value="7">July</option>                          
	                            <option value="8">August</option>                            
	                            <option value="9">September</option>                    
	                            <option value="10">October</option>                             
	                            <option value="11">November</option>                            
	                            <option value="12">December</option>                            
	                        </select>
           
           <select class="selected"><option value="2">Year</option> 
                                    <option value="2019">2019</option>                          
	                            <option value="2020">2020</option>                           
	                            <option value="2021">2021</option>                           
	                            <option value="2022">2022</option>                          
	                            <option value="2023">2023</option>                            
	                            <option value="2024">2024</option>                    
	                            <option value="2025">2025</option>                             
	                            <option value="2026">2026</option>                            
	                            <option value="2027">2027</option>
           </select> <br>
           <p>Security Code</p>
           <input type="text"  size="15" placeholder="Insert security code" pattern="[0-9]{3}" title="code number required" required><br>
           
           <p>Ukupna cena je: ${sessionScope.cena} evra </p>

           <input type="submit" value="Plati"><br>
  
       
           <a href="index.jsp" >Nazad </a>
    </form>
        
     </c:if>   
        
        
        
        
        
        </div>
    </body>
</html>
