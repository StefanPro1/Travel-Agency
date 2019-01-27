<%-- 
    Document   : newjsp
    Created on : 27-Jul-2018, 14:16:46
    Author     : Stefan Prokic
--%>


<%@page import="model.AvioKompanije"%>
<%@page import="java.lang.System"%>
<%@page import="Util.Util"%>
<%@page import="model.Destinacije"%>
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

        <title>Avio karte online </title>

        <link href="css/style1.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>

        <div class="navbar navbar-inverse">

            <div class="container">
                <div class="navbar-header">
                    <a class="logo">Pro-Travel</a>
                    <img src = "img/world.png" width=50 height=50 >
                </div>

                <c:if test="${sessionScope.admin !=null}">
                    <div class="navbar">
                        <ul class="nav navbar-nav navbar-right">   
                            <li><a  href="Login.jsp">Login</a></li>

                        </ul>
                    </div>

                </div>

            </div>




            <div id="home-sec">


                <div class="container"  >
                    <div class="text-center">

                        <span class="head-main" >Pro-Travel admin logged in</span>




                    </div>
                </div>
            </div>


            <section>
                <div class="container">

                    <div class="text-center g-pad-bottom">
                        <div class="box1">
                            <h4>Unos novih destinacija i update cena</h4>

                            <form action="" id="adminform" method="post">
                                <p>Unesi Id Destinacije</p> 
                                <input type="text" name="id">    
                                <p>Unesi Grad</p> 
                                <input type="text" name="grad">
                                <p>Unesi Drzavu</p> 
                                <input type="text" name="drzava">
                                <p>Unesi Cenu</p>
                                <input type="text" name="cena">

                                <input type="submit"  id="sub1" value="Create new" onclick="javascript: form.action = 'insert'">  
                                <input type="submit"  id="sub2" value="Update" onclick="javascript: form.action = 'update'">  
                            </form>
                        </div >
                    </div >
                </div >


            </section>
            <div id="footer">

                <div class="leftbox">

                    Administrator logged in:
                    ${sessionScope.username} || 
                    <a href="logout">Logout</a> 

                </div>

                2018 Stefan Prokic| All Right Reserved  

            </div>

        </c:if>

        <c:if test="${sessionScope.admin == null}">
            <div class="navbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Hoteli.jsp">Hoteli</a></li>
                    <li><a  href="Login.jsp">Login</a></li>
                    <li><a href="Registracija.jsp">Registracija</a></li>
                </ul>
            </div>


        </div>

    </div>




    <div id="home-sec">


        <div class="container"  >
            <div class="text-center">

                <span class="head-main" >Prodaja avionskih karata i rezervacije hotela </span>
                <h3 class="head-last">Najpovoljnije karte za sve destinacije</h3>



            </div>
        </div>
    </div>


    <section>
        <div class="container">
            <div>
                <div class="text-center g-pad-bottom">
                    <div class="box1">
                        <h4>Rezervisite Vas let</h4>
                        <p>
                            Odaberi destinaciju
                        </p>
                        <form action="PlanLeta" method="post">
                            <select class="menu" name="polazak" title="Polazište">
                                <%    Session s = Util.getSessionFactory().openSession();
                                    s.beginTransaction();
                                    Destinacije d = (Destinacije) s.load(Destinacije.class, 1);
                                    out.println("<option value=" + d.getIdDestinacije() + ">" + d.getGrad() + " " + "-" + " " + d.getDrzava() + "</option>");
                                    s.close();
                                %>
                            </select>   

                            <select class="menu1" name="destinacija" title="Odrediste">
                                <%
                                    SessionFactory sf = Util.getSessionFactory();
                                    s = sf.openSession();
                                    Transaction tr = s.beginTransaction();
                                    Criteria crit = s.createCriteria(Destinacije.class);
                                    List<Destinacije> list = crit.list();
                                    for (Destinacije dd : list) {
                                        out.println("<option value=" + dd.getIdDestinacije() + ">" + dd.getGrad() + " " + "-" + " " + dd.getDrzava() + "</option>");
                                    }
                                    s.close();
                                    tr.rollback();
                                %> 

                            </select> 
                            <select class="menu2" id="Akompanije" name="Akompanije" title="Avio kompanije">
                                <%
                                    SessionFactory sesija = Util.getSessionFactory();
                                    s = sesija.openSession();
                                    Transaction t = s.beginTransaction();
                                    Criteria crite = s.createCriteria(AvioKompanije.class);
                                    List<AvioKompanije> lista = crite.list();
                                    for (AvioKompanije ak : lista) {
                                        out.println("<option value=" + ak.getIdAvioKompanije() + ">" + ak.getNaziv() + " " + "</option>");
                                    }
                                    s.close();
                                    t.rollback();
                                %> 

                            </select> 

                            <label for="1">Datum/Odlazak</label>
                            <input id="1" name="datum" type="text" class="datepicker" required >
                            <script>
                                $(function () {
                                    $(".datepicker").datepicker();
                                });
                            </script>

                            <label id="tri" style="display:none" for="1">Datum/Povratak</label>  
                            <input id="dva" type="text" class="datepicker" style="display:none">
                            <script>
                                $(function () {
                                    $(".datepicker").datepicker();
                                });
                            </script>



                            <br>
                            <br>
                            Povratna karta: <input type="checkbox" name="povratak" id="Povratak" onclick="Metoda()"> <br>

                            <script type="text/javascript" language="JavaScript">
                                function Metoda() {
                                    var checkBox = document.getElementById("Povratak");
                                    var kalendar = document.getElementById("dva");
                                    var labela = document.getElementById("tri");
                                    if (checkBox.checked === true) {
                                        kalendar.style.display = "block";
                                        labela.style.display = "block";
                                    } else {
                                        kalendar.style.display = "none";
                                        labela.style.display = "none";
                                    }
                                }</script>                             
                            <label id="cetiri"  for="osoba">Izaberite broj karata</label>  
                            <select name="bkarata"  id="osoba">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>                           


                            <label id="group"> Izaberite velicinu prtljaga
                                <input type="radio" name="button" value="small +0 evra" title="torba do 12 kg" checked="checked" />
                                <img src="img/suitcase.png">
                                <input type="radio" name="button" value="medium +25 evra" title="dve torbe do 20 kg" />
                                <img src="img/suitcasem.png">
                                <input type="radio" name="button" value="large +60 evra" title="prtljag preko 30 kg" />
                                <img src="img/suitcasel.png">

                            </label>



                            <c:if test="${sessionScope.logged!=null}">   
                                <input type="submit" class="submit" id="" value="Potvrdi">     
                            </c:if>

                        </form>


                        <c:if test="${sessionScope.logged==null}">
                            <div class ="13">
                                <input type="submit" class="submit" id="k2" value="Potvrdi"> 
                                <script type="text/javascript" language="JavaScript">
                                    window.onload = function () {
                                        document.getElementById("k2").onclick = function () {
                                            alert("Potrebno je da se ulogujete!");
                                            window.location.replace("Login.jsp");
                                            
                                            return false;
                                        }
                                    }

                                </script> 
                            </div >
                        </c:if>


                    </div>



                </div>
            </div>
            <div>

                <div >
                    <div>

                        <div class="box4">
                            <h4 >Prag 189 evra</h4>



                        </div>
                    </div> 

                </div>
                <div >
                    <div >

                        <div class="box5">
                            <h4 > Moskva 240 evra </h4>



                        </div>
                    </div> 

                </div>
                <div>
                    <div>

                        <div class="box6">
                            <h4 >Pariz 139 evra</h4>



                        </div>
                    </div> 

                </div>
            </div>

        </div>
    </section>

    <div id="footer">
        <c:if test="${sessionScope.logged!=null}">
            <div class="leftbox">

                Logged in:
                ${sessionScope.username} || <c:if test="${sessionScope.logged!=null}"> |
                    <a href="logout">Logout</a> </c:if>

                </div>
        </c:if>
        <c:if test="${sessionScope.admin !=null}">
            <div class="leftbox">

                Administrator logged in:
                ${sessionScope.username} || <c:if test="${sessionScope.logged!=null}"> |
                    <a href="logout">Logout</a> </c:if>

                </div>
        </c:if>
        2018 Stefan Prokic| All Right Reserved  

    </div>

</body>
</c:if>
</html>
